package koir

import ".."

RegexValue :: struct {
	using base: koi.Value,
}

regex_function :: proc(state: ^koi.Value, args: []^koi.Value) -> ^koi.Value {
	/* Returns a table with the following structure
	{
		pattern = args[0],
		regex = userdata wrapping the compiled regex
		match = fn regex_match
	}
	*/
}

regex_match :: proc(state: ^koi.Value, args: []^koi.Value) -> ^koi.Value {
	// should this be exported as its own function or should it just be accesed through the regex table
	// first arg should be a regex table
	// second arg should be the input to match against
	// returns an array of all the matches, where each match is an array of captures
}