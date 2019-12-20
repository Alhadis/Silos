when ODIN_OS == "windows" {
	foreign import ssl_lib "system:OpenSSL.lib";
} else {
	foreign import ssl_lib "system:ssl";
}

/* Note(ReneHSZ): unfortunately, as of 20180207, core:c.odin is broken... :-( */
c_int :: i32;
when ODIN_OS == "windows" || size_of(rawptr) == 4 {
	c_long :: i32;
} else {
	c_long :: i64;
}
when ODIN_OS == "windows" || size_of(rawptr) == 4 {
	c_ulong :: u32;
} else {
	c_ulong :: u64;
}

Method :: struct {
	// TODO(ReneHSZ): fill in struct members
}

Ctx :: struct {
	// TODO(ReneHSZ): fill in struct members
}

SSL :: struct {
	// TODO(ReneHSZ): fill in struct members
}

@(default_calling_convention="c")
foreign ssl_lib {
	@(link_name="SSL_library_init")                     library_init                     :: proc() -> c_int ---;

	@(link_name="SSL_CTX_new")                          ctx_new                          :: proc(method: ^Method) -> ^Ctx ---;
	@(link_name="SSL_CTX_set_options")                  ctx_set_options                  :: proc(ssl: ^SSL, opts: c_long) -> c_long ---;
	@(link_name="SSL_CTX_get_options")                  ctx_get_options                  :: proc(ctx: ^Ctx) -> c_long ---;
	@(link_name="SSL_CTX_clear_options")                ctx_clear_options                :: proc(ctx: ^Ctx, opts: c_long) -> c_long ---;

	@(link_name="SSL_set_options")                      set_options                      :: proc(ssl: ^SSL, opts: c_long) -> c_long ---;

	@(link_name="SSL_clear_options")                    clear_options                    :: proc(ssl: ^SSL, opts: c_long) -> c_long ---;

	@(link_name="SSL_get_servername")                   get_servername                   :: proc(ssl: ^SSL, typ: c_int) -> ^byte ---;
	@(link_name="SSL_get_options")                      get_options                      :: proc(ssl: ^SSL) -> c_long ---;
	@(link_name="SSL_get_secure_renegotiation_support") get_secure_renegotiation_support :: proc(ssl: ^SSL) -> c_long ---;
}
