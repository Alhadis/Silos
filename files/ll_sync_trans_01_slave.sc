#
IMPORT: ll_slave_cfg.sc

ERROR: {EXT_ADV_FOR_CONN_HANDLE}
IMPORT: hci_reset.sc
IMPORT: hci_connect_as_slave.sc

IMPORT: hci_start_adv_period.sc

# period adv set info transfer
DELAY: 1500
DEFINE: service_data, BYTE, ABCD

FOR: {i,1}, 0, 20
	CUSTOM: PENDING
	WARNING: Send Sync Transfer Param
	SEND: 01 5B 20 05 {CON_HDL} {service_data} {EXT_PER_ADV_HANDLE}
	RECV: 04 0E 06 05 5B 20 00 {CON_HDL}
LOOP
CUSTOM: PENDING

IMPORT: hci_disconnect.sc
IMPORT: hci_disconnected.sc
