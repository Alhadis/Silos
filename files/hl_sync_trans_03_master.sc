#sync trans master
IMPORT: hl_master_cfg.sc

IMPORT: rw_reset.sc
IMPORT: rw_connect_as_master.sc

IMPORT: rw_start_adv_period.sc

FOR: {cnt,1},0,16
	CUSTOM: PENDING
	WARNING: Send sync trans param
	DEFINE: SERV_DATA, BYTE, 1234
	SEND: 05 350E0E001000 0400 1C {idx_adv_period} {SERV_DATA}
	RECV: 05 000E10000E00 0200 1C 00
LOOP

CUSTOM: SYNC
IMPORT: rw_disconnected.sc
IMPORT: hl_finish.sc

