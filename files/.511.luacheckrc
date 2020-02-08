max_line_length = 250

allow_defined = true -- Allow defining globals implicitly by setting them.
allow_defined_top = true

exclude_files = {
    ".luacheckrc",
}

ignore = {
	"12.", -- ignore "Setting a read-only global variable/Setting a read-only field of a global variable."
	"21.", -- Ignore all Unused warnings. 
    "611", -- disable "line contains only whitespace"
}