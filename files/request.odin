package http

import "core:os"
import "core:fmt"
import zed "shared:zed_net"

Method :: enum {
	Invalid,
	OPTIONS,
	GET,
	HEAD,
	POST,
	PUT,
	DELETE,
	TRACE,
	CONNECT,
}

Request :: struct {
	method: Method,
	uri: URI,
	version: Version,
	headers: map[string]string,
	body: [dynamic]u8,
}

validate_method_str :: proc(str: string) -> Method {
	switch str {
		case "OPTIONS": return Method.OPTIONS;
		case "GET":     return Method.GET;
		case "HEAD":    return Method.HEAD;
		case "POST":    return Method.POST;
		case "PUT":     return Method.PUT;
		case "DELETE":  return Method.DELETE;
		case "TRACE":   return Method.TRACE;
		case "CONNECT": return Method.CONNECT;
	
		case: return Method.Invalid;
	}
}

parse_request_line :: proc(r: ^Request, state: ^ParserState) -> Error {
	line, err := read_line(state);
	//TODO: defer delete(line), and allocate seperate strings for all the props
	if err != Error.None do return err;

	// RFC 2616 recommends for robustness sake to ignore CRLFs sent before the Request-Line (Section 4.1)
	for line == "" {
		line, err = read_line(state);
	}

	fmt.printf("line: '%s'\n", line);

	offset := 0;
	method_str := read_word(line, &offset);
	
	method := validate_method_str(method_str);
	if method == Method.Invalid {
		return Error.InvalidMethod;
	}
	r.method = method;

	end_of_string := false;
	if end_of_string, offset = skip_sp(line, offset); end_of_string {
		// handle error
		assert(false);
	}

	uri_str := read_word(line, &offset);
	r.uri.path = uri_str;

	if end_of_string, offset = skip_sp(line, offset); end_of_string {
		// handle error
		assert(false);
	}

	version_str := read_word(line, &offset);
	version, error := parse_version(version_str);
	if error != Error.None do return error;
	r.version = version;

	return Error.None;
}

parse_request :: proc(stream: os.Handle, socket: ^zed.Socket) -> (Request, Error) {
	result: Request;
	state: ParserState;
	init_state(&state, stream, socket);

	fmt.printf("Parsing request line\n");

	error := parse_request_line(&result, &state);
	// send a bad request and terminate the connection, once we get to the connection part
	// Perhaps a 'Not Implemented' message would be better as the method could be an extension. Error.InvalidMethod specific?
	if error != Error.None do return result, error;

	fmt.printf("Parsed request\n");

	// parser_headers
	line: string = "";
	line, error = read_line(&state);
	if error != Error.None do return result, error;
	for line != "" {
		//TODO: Handle Header continuation RFC 2616 Sec. 2.2 - LWS
		header_name, offset := parse_token(line, 0);

		if line[offset] != ':' {
			return result, Error.BadHeaderFormat;
		}
		offset += 1;

		end_of_string := false;
		if end_of_string, offset = skip_sp(line, offset); end_of_string {
			// Is this a bad header? Or is empty headers allowed
			// Should we delay this till we see if the next line has LWS?
			return result, Error.BadHeaderFormat;
		}

		header_part := line[offset:];
		strip_offs := len(header_part)-1;
		for header_part[strip_offs] == SP || header_part[strip_offs] == HT {
			if strip_offs <= 0 do break; // Reached start of string
			strip_offs -= 1;
		}
		header_part = header_part[:strip_offs+1];
		result.headers[header_name] = header_part;

		line, error = read_line(&state);
		if error != Error.None do return result, error;
	}

	host, ok := result.headers["Host"];
	if !ok {
		//TODO: Does RFC 2616 say that as a HTTP 1.1 server we should just drop?
		// Error.NoHostHeader?
	}
	result.uri.host = host; //TODO: Who owns this memory?

	// Is this ever anything else? https?
	result.uri.scheme = "http";

	// check content-length and parse content

	return result, error;
}
