package http

import "core:os"
import zed "shared:zed_net"

CRLF :: "\r\n";
CR :: '\r';
LF :: '\n';
SP :: ' ';
HT :: '\t';

ParserState :: struct {
	stream: os.Handle,
	client_socket: ^zed.Socket,
	current_rune: rune,
	offset: int,
	total_read: int,
}

next_rune :: proc(state: ^ParserState) -> Error {
	//TODO: utf8
	when false {
		buffer: [1]u8;
		_, errno := os.read(state.stream, buffer[:]);
		fmt.printf("os.read ernno: %d\n", errno);
	} else {
		buffer: [1]u8;
		zed.tcp_socket_receive(state.client_socket, &buffer[0], 1);
	}

	state.current_rune = rune(buffer[0]);
	state.total_read += 1;

	if state.total_read >= MAX_ENTITY_SIZE do return Error.EntityTooLarge;
	return Error.None;
}

read_line :: proc(using state: ^ParserState) -> (string, Error) {
	buffer: [dynamic]u8;
	prev_char := rune(0);
	err := next_rune(state);
	for {
		if prev_char == CR && current_rune == LF {
			return string(buffer[:]), err;
		}
		if prev_char != 0 do append(&buffer, u8(prev_char));
		prev_char = current_rune;
		err = next_rune(state);
	}

	return "", Error.EntityTooLarge;
}

init_state :: proc(using state: ^ParserState, stream_handle: os.Handle, socket: ^zed.Socket) -> Error {
	stream = stream_handle;
	client_socket = socket;
	return Error.None;
}

read_word :: proc(line: string, offset: ^int) -> string {
	start := offset^;
	for line[offset^] != SP {
		offset^ += 1;
		if offset^ >= len(line) do return string(line[start:offset^]);
	}
	return string(line[start:offset^]);
}

parse_token :: proc(line: string, offset: int) -> (result: string, new_offset: int) {
	new_offset = offset;
	
	for new_offset < len(line) {
		switch line[new_offset] {
			// Seperators
			case '(', ')', '<', '>', '@', ',', ';', ':', '\\' , '"', '/', '[', ']', '?', '=', '{', '}', SP, HT:
				result = line[offset:new_offset];
				return;
			// CTLs - Control characters
			case 0..31:
				result = line[offset:new_offset];
				return;
		}

		new_offset += 1;
	}

	result = line[offset:new_offset];
	return;
}

skip_sp :: proc(line: string, offset: int) -> (end_of_string: bool, new_offset: int) {
	new_offset = offset;
	if new_offset >= len(line) do return true, new_offset;

	for new_offset < len(line) && line[new_offset] == SP {
		new_offset += 1;
	}

	end_of_string = new_offset >= len(line);
	return;
/*
	if offset^ >= len(line) do return false;
	for line[offset^] == SP {
		offset^ += 1;
		if offset^ >= len(line) do return false;
	}
	return true;*/
}

_parse_int :: proc(s: string, offset: int) -> (result: int, new_offset: int, ok: bool) {
	// Grabbed from core:fmt
	is_digit :: inline proc(r: byte) -> bool { return '0' <= r && r <= '9' }

	new_offset = offset;
	for new_offset < len(s) {
		c := s[new_offset];
		if !is_digit(c) do break;
		new_offset += 1;

		result *= 10;
		result += int(c)-'0';
	}
	ok = new_offset > offset;
	return;
}