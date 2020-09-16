using import enum
using import Array
using import struct

let number-regexp1 number-regexp2 number-regexp3 =
    do
        hex-digit := "[0-9a-fA-F]"
        bin-digit := "[01]"
        oct-digit := "[0-7]"
        fn re-or (...)
            let result =
            .. "("
                va-lifold ""
                    inline (index _. value computed-result)
                        if (index < ((va-countof ...) - 1))
                            .. computed-result value "|"
                        else
                            .. computed-result value
                    ...
                ")"

        fn number-dot-number (prefix class)
            let class+ = (class .. "+")
            .. prefix (re-or (class+ .. "\\.") ("\\." .. class+) (.. class+ "\\." class+))
        # had to split in three parts because it was too big for the engine
        let number-regexp1 =
            .. "^[+-]?"
                # no fractional part
                (..
                    (re-or
                        "\\d+"
                        (.. "0b" bin-digit "+")
                        (.. "0o" oct-digit "+")
                        (.. "0x" hex-digit "+"))
                    "(\\:"
                            (re-or
                                ("f" .. (re-or "32" "64"))
                                ("[ui]" .. (re-or "8" "16" "32" "64"))
                                "usize") ")?")
                # token interrupting characters
                "(?=[,'()\\[\\]{} \\n]|$)"
        # floats with fractional part
        let number-regexp2 =
            .. "^[+-]?"
                (..
                    (re-or
                       (number-dot-number "" "\\d")
                       (number-dot-number "0b" bin-digit))
                   "(e[+-]\\d+)?"
                   (re-or ":f32" ":f64") "?")
                "(?=[,'()\\[\\]{} \\n]|$)"
        let number-regexp3 =
            .. "^[+-]?"
                (..
                    (re-or
                       (number-dot-number "0o" oct-digit)
                       (number-dot-number "0x" hex-digit))
                   "(e[+-]\\d+)?"
                   (re-or ":f32" ":f64") "?")
                "(?=[,'()\\[\\]{} \\n]|$)"
        _ number-regexp1 number-regexp2 number-regexp3
# make regexps constant
run-stage;

fn strip-ANSI-codes (str)
    let pattern = "^\\\x1b\\[.+?m"
    let match? start end = ('match? pattern str)
    let str =
        if match?
            rslice str end
        else
            str
    let pattern = "\\\x1b\\[.+?m$"
    let match? start end = ('match? pattern str)
    let str =
        if match?
            lslice str start
        else
            str

fn flatten-list (l)
    fn flatten-list (old-list new-list)
        returning list
        let at next = (decons old-list)
        atT := ('typeof at)
        next as:= list
        let new-list =
            if (atT == list)
                # go deeper
                this-function (at as list) new-list
            else
                cons at new-list
        if (not (empty? next))
            this-function next new-list
        else
            new-list

    'reverse (flatten-list l '())

inline lines (text-buffer)
    Generator
        inline "start" ()
            let match? start end = ('match? "^.*(\\n|$)" text-buffer)
            _ start end
        inline "valid?" (sol eol)
            sol < (countof text-buffer)
        inline "at" (sol eol)
            slice text-buffer sol eol
        inline "next" (sol eol)
            let str = (rslice text-buffer eol)
            let match? start end = ('match? "^.*(\\n|$)" str)
            # must add offset from previous line
            _ (eol + start) (eol + end)

enum HighlightingStyle plain
    Default
    Keyword
    Operator
    Function
    SugarMacro
    SpiceMacro
    Comment
    String
    Number
    Type
    SpecialConstant
    GlobalSymbol
    Symbol

struct HighlightedText plain
    style : HighlightingStyle
    content : string

fn symbol->style (symbol)
    let symbols = (import .scopes-std-symbols.symbols)
    imply symbol Symbol
    inline has-symbol? (scope)
        try
            ('@ scope symbol)
            true
        except (ex)
            false
    if (has-symbol? symbols.keywords)
        HighlightingStyle.Keyword
    elseif (has-symbol? symbols.functions)
        HighlightingStyle.Function
    elseif (has-symbol? symbols.operators)
        HighlightingStyle.Operator
    elseif (has-symbol? symbols.types)
        HighlightingStyle.Type
    elseif (has-symbol? symbols.sugar-macros)
        HighlightingStyle.SugarMacro
    elseif (has-symbol? symbols.spice-macros)
        HighlightingStyle.SpiceMacro
    elseif (has-symbol? symbols.global-symbols)
        HighlightingStyle.GlobalSymbol
    elseif (has-symbol? symbols.special-constants)
        HighlightingStyle.SpecialConstant
    else
        HighlightingStyle.Default

enum HighlightingMode
    Default
    Comment :
        offset = i32;
    MultilineString :
        offset = i32;
    OpenBracket # unused for now
    inline __typecall (cls)
        this-type.Default;

# text is the text buffer containing the code.
fn highlight-tokens (tokens text)
    # now we walk through the actual text
    local result : (Array HighlightedText)
    'reserve result (countof tokens)
    fold (lines-highlighted tokens-highlighted mode = 0 0 (HighlightingMode.Default)) \
    for line in (lines text)
        # check if we must break a comment or multiline string
        inline broke-indentation? (offset starter-pattern)
            imply starter-pattern string
            let regexp = (.. "^\\s*(?=[^\\s\\n])(?!" starter-pattern ")")
            let match? start end = ('match? regexp line)
            if match?
                end < offset
            else
                false

        :: skip-line
        dispatch mode
        case Comment (offset)
            if (not (broke-indentation? offset "#"))
                'append result
                    HighlightedText
                        content = line
                        style = HighlightingStyle.Comment
                merge skip-line
                    lines-highlighted + 1
                    tokens-highlighted
                    HighlightingMode.Comment offset
        case MultilineString (offset)
            if (not (broke-indentation? offset "\"{4}"))
                'append result
                    HighlightedText
                        content = line
                        style = HighlightingStyle.String
                merge skip-line
                    lines-highlighted + 1
                    tokens-highlighted
                    HighlightingMode.MultilineString offset
        default
            ;

        let tokens-this-line last-point =
            loop (tokens-this-line last-point = 0 1:usize)
                let index = (tokens-highlighted + tokens-this-line)
                if (index >= (countof tokens))
                    break tokens-this-line last-point
                let current-token = (tokens @ index)

                anchor := ('anchor current-token)
                line-number := (sc_anchor_lineno anchor)
                column := (sc_anchor_column anchor)
                column-index := (column - 1)
                line-highlight-point := (lines-highlighted + 1)

                if (line-number > line-highlight-point)
                    # continue on the next line
                    break tokens-this-line last-point

                if ('none? current-token)
                    # it seems empty function arg gets a weird anchor so lets just skip it.
                    repeat (tokens-this-line + 1) last-point

                assert (line-highlight-point <= line-number) # did we skip too much outside this loop?
                # now that we know we're on the right line, we can slice away what we want
                # append whitespace or whatever else there is between last token and current
                if (column > last-point)
                    'append result
                        HighlightedText
                            content = (slice line (last-point - 1) (column - 1))
                            style = HighlightingStyle.Default

                let tokenT = ('typeof current-token)
                if (tokenT == Symbol)
                    current-token as:= Symbol
                    switch current-token
                    case 'sugar-quote
                        if ((line @ column-index) == 39:i8) # ' character
                            # what if it's a quoted list?
                            if ((line @ (column-index + 1)) == 40:i8) # ( character
                                'append result
                                    HighlightedText
                                        content = "'"
                                        style = HighlightingStyle.Keyword
                                _ (tokens-this-line + 1) ((column + 1) as usize)
                            else
                                # FIXME: caution! content could have ended with sugar quote!
                                assert ((index + 1) < (countof tokens))
                                let next-token = (tokens @ (index + 1))
                                let plaintext-next-token = (strip-ANSI-codes (tostring next-token))
                                'append result
                                    HighlightedText
                                        content = (.. "'" plaintext-next-token)
                                        style = HighlightingStyle.Symbol
                                _ (tokens-this-line + 2) (column + 1 + (countof plaintext-next-token))
                        else
                            'append result
                                HighlightedText
                                    content = "sugar-quote"
                                    style = (symbol->style (current-token as Symbol))
                            _ (tokens-this-line + 1) (column + (countof (strip-ANSI-codes (tostring current-token))))

                    pass 'spice-quote
                    pass 'square-list
                    pass 'curly-list
                    do
                        let alias-character =
                            switch current-token
                            case 'spice-quote 96:i8 # `
                            case 'square-list 91:i8 # [
                            case 'curly-list 123:i8 # {
                            default (assert false) 0:i8
                        # I wanted style to always be "keyword" but then I need to match brackets.
                        # Maybe next time!
                        let content style =
                            if ((line @ column-index) == alias-character)
                                _ (alias-character as string) HighlightingStyle.Default
                            else
                                _ (strip-ANSI-codes (tostring current-token)) HighlightingStyle.Keyword

                        'append result
                            HighlightedText
                                content = content
                                style = style
                        _ (tokens-this-line + 1) (column + (countof content))
                    default
                        let plaintext-token = (strip-ANSI-codes (tostring current-token))
                        'append result
                            HighlightedText
                                content = plaintext-token
                                style = (symbol->style current-token)
                        _ (tokens-this-line + 1) (column + (countof plaintext-token))
                elseif ((tokenT < real) or (tokenT < integer))
                    let line-remainder = (rslice line (column - 1))
                    let match1? start1 end1 = ('match? number-regexp1 line-remainder)
                    let match2? start2 end2 = ('match? number-regexp2 line-remainder)
                    let match3? start3 end3 = ('match? number-regexp3 line-remainder)
                    assert (or match1? match2? match3?)
                    let number-length =
                        if match1?
                            end1
                        elseif match2?
                            end2
                        else
                            end3
                    number-length as:= usize

                    'append result
                        HighlightedText
                            content = (lslice line-remainder number-length)
                            style = HighlightingStyle.Number
                    _ (tokens-this-line + 1) (column + number-length)
                elseif (tokenT == string)
                    current-token as:= string
                    # if it's a multiline string, do nothing and let the code after the loop handle it.
                    if ('match? "^\"{4}" (rslice line (column - 1)))
                        _ (tokens-this-line + 1) (column as usize)
                    else
                        'append result
                            HighlightedText
                                content = (tostring current-token)
                                style = HighlightingStyle.String
                        _ (tokens-this-line + 1) (column + (countof (tostring current-token)))
                else
                    # shouldn't happen
                    assert false ("Unknown token type: " .. (tostring tokenT))
                    _ 0 0:usize

        last-point-index := (last-point - 1)
        assert (last-point-index <= (countof line))
        line-remainder := (rslice line last-point-index)
        # now we append the rest of the line.
        # check if we didn't start a comment or multiline string.
        let match-mlstring? __ end-mlstring-preamble = ('match? "\\s*(?=\"{4})" line-remainder)
        let match-comment? __ end-comment-preamble = ('match? "\\s*(?=#)" line-remainder)
        # first add the text between last point and comment/string, then those.
        if match-mlstring?
            'append result
                HighlightedText
                    content = (lslice line-remainder end-mlstring-preamble)
                    style = HighlightingStyle.Default
            'append result
                HighlightedText
                    content = (rslice line-remainder end-mlstring-preamble)
                    style = HighlightingStyle.String
            _
                lines-highlighted + 1
                tokens-highlighted + tokens-this-line
                # multiline string offset actually starts after the quotes.
                HighlightingMode.MultilineString
                    offset =
                        (last-point-index + (end-mlstring-preamble + 4)) as i32
        elseif match-comment?
            'append result
                HighlightedText
                    content = (lslice line-remainder end-comment-preamble)
                    style = HighlightingStyle.Default
            'append result
                HighlightedText
                    content = (rslice line-remainder end-comment-preamble)
                    style = HighlightingStyle.Comment
            _
                lines-highlighted + 1
                tokens-highlighted + tokens-this-line
                HighlightingMode.Comment
                    offset =
                        (last-point-index + end-comment-preamble + 1) as i32
        else
            'append result
                HighlightedText
                    content = line-remainder
                    style = HighlightingStyle.Default
            _ (lines-highlighted + 1) (tokens-highlighted + tokens-this-line) (HighlightingMode.Default)
        skip-line ::
    result

fn highlight (code)
    imply code string
    # get code into a more friendly format for our purposes:
    # a flat array of tokens.
    let parsed-code =
        try
            (sc_parse_from_string code) as list
        except (ex)
            hide-traceback;
            error ("Parsing failed: " .. ('format ex))
    if (empty? parsed-code)
        # NOTE: has to be a local because of a compiler bug.
        # can be changed after it's fixed but it's not a big deal.
        return (local ht : (Array HighlightedText))
    # flat list -> ValueArray
    flattened := (flatten-list parsed-code)
    let at next = (decons flattened)
    local token-array : (Array Value)
    'reserve token-array (countof flattened)
    loop (at next = at next)
        next as:= list
        'append token-array at
        if (empty? next)
            break;
        decons next
    highlight-tokens token-array code

do
    let
        highlight
        HighlightingStyle
        HighlightedText
    locals;
