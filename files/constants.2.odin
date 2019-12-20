using import "types.odin";

MULTIPLIER_8	:: 141;
MULTIPLIER_16	:: 12829;
MULTIPLIER_32	:: 747796405;
MULTIPLIER_64	:: 6364136223846793005;
MULTIPLIER_128	:: 47026247687942121848144207491837523525;

INCREMENT_8	:: 77;
INCREMENT_16	:: 47989;
INCREMENT_32	:: 2891336453;
INCREMENT_64	:: 1442695040888963407;
INCREMENT_128	:: 117397592171526113268558934119004209487;
mults := []u128{
	MULTIPLIER_8,
	MULTIPLIER_16,
	MULTIPLIER_32,
	MULTIPLIER_64,
	MULTIPLIER_128,};
incs := []u128{
	INCREMENT_8,
	INCREMENT_16,
	INCREMENT_32,
	INCREMENT_64,
	INCREMENT_128,};
tindex :: inline proc(T: type) -> uint {
	when T == u8 do return 0;
	else when T == u16 do return 1;
	else when T == u32 do return 2;
	else when T == u64 do return 3;
	else when T == u128 do return 4;
	else do compile_assert(false);
	return 0;
}
type_constant :: inline proc(T: type, arr: []u128) -> T {
	return T(arr[tindex(T)]);
}
inc_of :: inline proc(using ___state: ^$T/State($S), Kind: type) -> S {
	when Kind == Unique do return T(rawptr(state) | 1);
	else when Kind == Mcg do return 0;
	else when T == Setseq do return inc;
	else do return type_constant(S, incs);
	return 0;
}
/* for oneseq and unique */
STATE_LCG_8_INIT	:: 0xD7;
STATE_LCG_16_INIT	:: 0x20DF;
STATE_LCG_32_INIT	:: 0x46B56677;
STATE_LCG_64_INIT	:: 0x4D595DF4D0F33173;
STATE_LCG_128_INIT	:: 0xB8DC10E158A9239298046DF007EC0A53;

STATE_MCG_8_INIT	:: 0xE5;
STATE_MCG_16_INIT	:: 0xA5E5;
STATE_MCG_32_INIT	:: 0xD15EA5E5;
STATE_MCG_64_INIT	:: 0xCAFEF00DD15EA5E5;
STATE_MCG_128_INIT	:: 0x0000000000000000CAFEF00DD15EA5E5;

/*STATE_SETSEQ_8_INIT 	:= State(Setseq(u8)){{0x9B, 0xDB}};
STATE_SETSEQ_16_INIT 	:= State(Setseq(u16)){{0xe39b, 0x5bdb}};
STATE_SETSEQ_32_INIT 	:= State(Setseq(u32)){{0xec02d89b, 0x94b95bdb}};
STATE_SETSEQ_64_INIT 	:= State(Setseq(u64)){{0x853c49e6748fea9b,
						0xda3e39cb94b95bdb}};
STATE_SETSEQ_128_INIT 	:= State(Setseq(u128)){{
	0x979c9a98d84620057d3e9cb6cfe0549b,
	0x0000000000000001da3e39cb94b95bdb}};*/
