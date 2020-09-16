#
ERROR: hl_sync_trans_CTE_01_slave.sc START
IMPORT: hl_slave_cfg.sc

IMPORT: rw_reset.sc
IMPORT: rw_start_adv_period_cte.sc
IMPORT: rw_connect_as_slave.sc

DELAY:1500

WARNING: Send sync trans param
DEFINE: SERV_DATA, BYTE, 1234
SEND: 05 350E0E001000 0400 1C {idx_adv_period} {SERV_DATA}
RECV: 05 000E10000E00 0200 1C 00

CUSTOM:PENDING

# Stop CTE in period adv
WARNING: Disable CTE TX
SEND: 05B20D0D0010000300 B2 {idx_adv_period} 00
RECV: 05000D10000D000200 B200

CUSTOM:PENDING

# Restart CTE in period adv
WARNING: Restart CTE TX
SEND: 05B20D0D0010000300 B2 {idx_adv_period} 01
RECV: 05000D10000D000200 B200

CUSTOM:PENDING

IMPORT: rw_disconnect.sc
IMPORT: rw_disconnected.sc

IMPORT: hl_finish.sc


