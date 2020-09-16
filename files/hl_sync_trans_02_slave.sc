#sync trans slave
IMPORT: hl_slave_cfg.sc

IMPORT: rw_reset.sc
IMPORT: rw_start_adv_period.sc
IMPORT: rw_connect_as_slave.sc

DELAY:2000
WARNING: Send sync trans param
DEFINE: SERV_DATA, BYTE, 1234
SEND: 05 350E0E001000 0400 1C {idx_adv_period} {SERV_DATA}
RECV: 05 000E10000E00 0200 1C 00

DELAY: 7000
IMPORT: rw_disconnect.sc
IMPORT: rw_disconnected.sc

IMPORT: hl_finish.sc
