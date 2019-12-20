package http

import "core:os"
import "core:fmt"
import "core:thread"
import "shared:birk/linkedlist"
//TODO: Replace with windows/bsd odin wrapper
//      Caouldnt be arsed because windows headers are a nightmare
import zed "shared:zed_net"

VERSION_11 :: "HTTP/1.1";

MAX_ENTITY_SIZE :: 8192;

Version :: struct {
	major, minor: u8,
}

URI :: struct {
	//flesh out
	scheme: string,
	path: string,
	host: string,
}

Error :: enum {
	None,
	EntityTooLarge,
	InvalidMethod,
	InvalidVersion,
	BadHeaderFormat,
}

parse_version :: proc(str: string) -> (Version, Error) {
	result: Version;

	min_len := 8; // HTTP/1*n.1*n
	if len(str) < min_len do return result, Error.InvalidVersion;

	// TODO
	// use read_token
	// skip_spht
	// expect slash
	// skip_spht
	// parse_int
	// skip_spht
	// expect dot
	// skip_sp_ht
	// parse_int
	// skip_sp_ht
	// expect end of the line
	http_part := str[:5];
	if http_part != "HTTP/" do return result, Error.InvalidVersion;

	version_part := str[5:];

	major, offset, ok := _parse_int(version_part, 0);
	if !ok do return result, Error.InvalidVersion;
	if major < 0 || major > 255 do return result, Error.InvalidVersion;

	if version_part[offset] != '.' do return result, Error.InvalidVersion;
	offset += 1;

	minor: int;
	minor, offset, ok = _parse_int(version_part, offset);
	if !ok do return result, Error.InvalidVersion;
	if minor < 0 || minor > 255 do return result, Error.InvalidVersion;

	result.major = u8(major);
	result.minor = u8(minor);

	return result, Error.None;
}


Server :: struct {
	address: string,
	port: u16,
	/* Implement all Time stuff when Bill gets done with the Time lib
		read_timeout: Time?,
	*/

	active_threads: linkedlist.LinkedList(^thread.Thread),
	listen_socket: zed.Socket,
}

Connection :: struct {
	parent: ^Server,
	client_socket: zed.Socket,
	client_addr: zed.Address,
}

handle_connection :: proc(t: ^thread.Thread) -> int {
	c := cast(^Connection) t.data;

	fmt.printf("Accepted! client address: '%s'\n", zed.host_to_str(c.client_addr.host));
	req, err := parse_request(os.Handle(c.client_socket.handle), &c.client_socket);
	fmt.printf("err: %v\n", err);
	fmt.printf("req: %#v\n", req);

	response := "HTTP/1.1 200 OK\r\nConnection: Close\r\nContent-Length: 13\r\n\r\nHello, world!";
	zed.tcp_socket_send(&c.client_socket, &response[0], i32(len(response)));

	zed.socket_close(&c.client_socket);

	free(c);
	return 0;
}

listen_and_serve :: proc(using server: ^Server) -> bool {
	// We assume zed.init() has been called. Private global bool for it?
	if zed.tcp_socket_open(&listen_socket, u32(server.port), false, true) != 0 {
		//zed.get_error()
		return false;
	}

	active_threads = linkedlist.make(^thread.Thread);

	client_socket: zed.Socket;
	client_addr: zed.Address;
	for zed.tcp_accept(&listen_socket, &client_socket, &client_addr) == 0 {
		connection := new(Connection);
		connection.parent = server;
		connection.client_socket = client_socket;
		connection.client_addr = client_addr;
		
		t := thread.create(handle_connection);
		t.data = rawptr(connection);
		thread.start(t);

		linkedlist.append(&server.active_threads, t);
	}

	return false;
}

main :: proc() {
	if zed.init() != 0 {
		fmt.printf("zed_net error: '%s'\n", zed.get_error());
		return;
	}
	defer zed.shutdown();

	server: Server;
	server.port = 4040;
	server.address = "localhost";
	listen_and_serve(&server);

/*	listen_socket: zed.Socket;
	port := u32(4040);
	zed.tcp_socket_open(&listen_socket, port, false, true);
	fmt.printf("Listening on ':%d'\n", port);

	client_socket: zed.Socket;
	client_addr: zed.Address;
	for zed.tcp_accept(&listen_socket, &client_socket, &client_addr) == 0 {
		fmt.printf("Accepted! client address: '%s'\n", zed.host_to_str(client_addr.host));
		req, err := parse_request(os.Handle(client_socket.handle), &client_socket);
		fmt.printf("err: %v\n", err);
		fmt.printf("req: %#v\n", req);

		response := "HTTP/1.1 200 OK\r\nConnection: Close\r\nContent-Length: 13\r\n\r\nHello, world!";
		zed.tcp_socket_send(&client_socket, &response[0], i32(len(response)));

		zed.socket_close(&client_socket);
	}*/

	/*example, errno := os.open("request_example.txt", os.O_RDONLY);
	assert(errno == os.ERROR_NONE);*/
}