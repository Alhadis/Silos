CUSTOM: DUMP_RAW
IMPORT: ll_slave_cfg.sc

IMPORT: hci_reset.sc

FOR: {i,1}, 0, 32
	IMPORT: hci_connect_as_slave.sc

	CUSTOM: PENDING

	IMPORT: hci_disconnect.sc
	IMPORT: hci_disconnected.sc
LOOP