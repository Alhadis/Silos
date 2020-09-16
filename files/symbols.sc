# usage: import the module and interate on the VALUES in each subscope.
let standard-lib =
    ..
        globals;
        import Array
        import Box
        import Capture
        import chaining
        import console
        import enum
        import FunctionChain
        import glm
        import glsl
        import itertools
        import Map
        import Option
        import property
        import Rc
        import Set
        import spicetools
        import String
        import struct
        import testing
        import UTF-8

let styles-map =
    do
        let style-none         = "None"
        let style-symbol       = "Symbol"
        let style-string       = "String"
        let style-keyword      = 'keywords
        let style-function     = 'functions
        let style-sfxfunction  = 'functions
        let style-operator     = 'operators
        let style-instruction  = "Instruction"
        let style-type         = 'types
        let style-comment      = "Comment"
        let style-error        = "Error"
        let style-warning      = "Warning"
        let style-location     = "Location"
        locals;

let symbols =
    do
        let
            # here we prepopulate some symbols that won't come up with the automatic query.
            keywords =
                'bind-symbols (Scope) 
                    else           = "else"          
                    elseif         = "elseif"        
                    then           = "then"          
                    case           = "case"          
                    pass           = "pass"          
                    default        = "default"       
                    curly-list     = "curly-list"    
                    quote          = "quote"         
                    unquote-splice = "unquote-splice"
                    syntax-log     = "syntax-log"    
                    in             = "in"            
                    square-list    = "square-list"   
                    options        = "options"       
                    static         = "static"        
                    plain          = "plain"         
                    packed         = "packed"        
                    new            = "new"           
                    continue       = "continue"      
                    except         = "except"        
                    define-infix   = "define-infix"
                    this-function  = "this-function"
                    :              = ":"
            functions = (Scope)
            operators = 
                'bind-symbols (Scope)
                    ->  = "->" 
                    **  = "**" 
                    //  = "//" 
                    >>  = ">>" 
                    <<  = "<<" 
                    //= = "//="
                    //= = "//="
                    >>= = ">>="
                    <<= = "<<="
                    |   = "|"
                    ||  = "||"

            types             =
                'bind-symbols (Scope)
                    this-type  = "this-type"
                    super-type = "super-type"
            sugar-macros      = (Scope)
            spice-macros      = (Scope)
            global-symbols    = 
                'bind-symbols (Scope)
                    main-module? = "main-module?"
                    module-dir   = "module-dir"
                    module-path  = "module-path"
                    module-name  = "module-name"
            special-constants =
                'bind-symbols (Scope)
                    true    = "true"
                    false   = "false"
                    null    = "null"
                    none    = "none"
                    unnamed = "unnamed"
                    # considering removing these and letting it to be
                    # handled by pattern matching
                    pi      = "pi"
                    -pi     = "-pi"
                    pi:f32  = "pi:f32"
                    -pi:f32 = "-pi:f32"
                    pi:f64  = "pi:f64"
                    -pi:f64 = "-pi:f64"
                    e       = "e"
                    -e      = "-e"
                    e:f32   = "e:f32"
                    -e:f32  = "-e:f32"
                    e:f64   = "e:f64"
                    -e:f64  = "-e:f64"
                    _+inf    = "+inf"
                    _-inf    = "-inf"
                    _nan     = "nan"
                    _Inf     = "Inf"
                    _-Inf    = "-Inf"
                    _NaN     = "NaN"
            modules =
                'bind-symbols (Scope)
                    Array         = "Array"
                    Box           = "Box"
                    Capture       = "Capture"
                    console       = "console"
                    enum          = "enum"
                    FunctionChain = "FunctionChain"
                    glm           = "glm"
                    glsl          = "glsl"
                    itertools     = "itertools"
                    Map           = "Map"
                    spicetools    = "spicetools"
                    struct        = "struct"
                    testing       = "testing"
                    UTF-8         = "UTF-8"
                    property      = "property"
                    Option        = "Option"
        locals;
run-stage;

inline merge-scopes (scopes...)
    va-lfold (Scope)
        inline (__discard arg result)
            fold (result = result) for k v in arg
                'bind result k v
        scopes...
let blacklist =
    merge-scopes
        symbols.keywords
        symbols.functions
        symbols.operators
        symbols.types
        symbols.sugar-macros
        symbols.spice-macros
        symbols.global-symbols
        symbols.special-constants
run-stage;

let symbols =
    fold (superscope = symbols) for scope in ('lineage standard-lib)
        fold (superscope = superscope) for k v in scope
            inline add-symbol (subscope-sym k)
                let subscope = (('@ superscope subscope-sym) as Scope)
                let subscope = ('bind subscope k (k as string))
                'bind superscope subscope-sym subscope

            let _type = ('typeof v)
            k as:= Symbol
            name := (k as string)
            let style = (sc_symbol_style k)

            inline has-key? (scope k)
                try
                    ('@ scope k)
                    true
                except (ex)
                    false
            if (has-key? blacklist k)
                # skip key entirely
                superscope
            elseif (style != 'style-symbol)
                let subscope-sym = ('@ styles-map style)
                add-symbol subscope-sym k
            # fallback for symbols not defined in cpp-land
            elseif (_type == Unknown)
                # some Closures get type "Unknown" for some reason
                (as? ('@ scope k) Closure) and (add-symbol 'functions k) or superscope
            # external scopes functions
            elseif (or
                        (va@ 0 ('match? "^sc_" name))
                        # in some cases the only way to detect an extern 
                        (('superof ('typeof v)) == pointer))
                add-symbol 'functions k
            elseif (_type == Closure)
                add-symbol 'functions k
            elseif (_type == type)
                add-symbol 'types k
            elseif (_type == SugarMacro)
                add-symbol 'sugar-macros k
            elseif (_type == SpiceMacro)
                add-symbol 'spice-macros k
            elseif (_type == Generator)
                add-symbol 'functions k
            elseif ((k as string) == "")
                #edge case
                add-symbol 'global-symbols "#unnamed"
            else
                add-symbol 'global-symbols k
