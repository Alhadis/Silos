#sync trans slave
IMPORT: hl_slave_cfg.sc

IMPORT: rw_reset.sc
IMPORT: rw_start_adv_period.sc
IMPORT: rw_connect_as_slave.sc

WARNING: LE Set Connection CTE Transmit Parameters command
DEFINE: cte_types, BYTE 07
SEND: 05 380E0E0010000700 20 {cte_types} 0400010203
RECV: 05 000E10000E000200 20 00

WARNING: LE Connection CTE Response Enable command
SEND: 05 3B0E0E0010000200 23 01
RECV: 05 000E10000E000200 23 00

DELAY: 10000
IMPORT: rw_disconnected.sc

IMPORT: hl_finish.sc

