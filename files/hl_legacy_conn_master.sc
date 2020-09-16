#
IMPORT: hl_master_cfg.sc

IMPORT: rw_reset.sc
#IMPORT: rw_connect_as_master.sc

FOR: {i,1}, 0, 100
	CUSTOM: PENDING
	IMPORT: rw_connect.sc
	#IMPORT: rw_connected.sc

	#Device connected
	SET: TIMEOUT, 3000
	#Connected
	RECV: 05 01 0E 10 00 0E 00 12 00 {CON_HDL,2} {CON_ITV,2} {CON_LTC,2} {CON_TOUT,2} 00 {REM_ADDR_TYPE} {REM_ADDR} {CON_ROLE,1} 00
	#Adv stopped
	RECV: 05 A5 0D 10 00 0D 00 04 00 {ACT_IDX,1} {ACT_TYPE,1} {_,2}
	#Le packet length indicate
	RECV: 05 2C 0E 10 00 0E 00 08 00 {CON_TX_OCT,2} {CON_TX_TIM,2} {CON_RX_OCT,2} {CON_RX_TIM,2}
	#Send Confirm
	SEND: 05 020E0E001000 3800 {LOC_CSRK} {LOC_CNT} {REM_CSRK} {REM_CNT} {LOC_AUTH} {CON_CFM_MISC}
	WARNING: Connected: {REM_ADDR_TYPE},{REM_ADDR},{CON_HDL},{CON_ROLE}

	# Delete activity
	SEND: 05A30d0d0010000200 A7 {CON_IDX}
	RECV: 05000D10000D000200 A700

	CUSTOM: PENDING

	IMPORT: rw_disconnected.sc
	
LOOP


IMPORT: hl_finish.sc
