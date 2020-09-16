#sync trans slave
IMPORT: hl_slave_cfg.sc

IMPORT: rw_reset.sc
IMPORT: rw_connect_as_slave.sc

DELAY: 5000
CUSTOM: SYNC

IMPORT: rw_disconnect.sc
IMPORT: rw_disconnected.sc

IMPORT: rw_reset.sc
IMPORT: hl_finish.sc
