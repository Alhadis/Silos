SET: DEBUG, 1

DEFINE: local_addr_type, BYTE, 01
DEFINE: conn_addr, BYTE, F0 F1 F2 F3 F4 F5
DEFINE: local_addr, BYTE, F5 F5 F5 F5 F5 F5

IMPORT: hci_reset.sc
IMPORT: hci_start_adv_period.sc
IMPORT: hci_start_connless_cte.sc

IMPORT: hci_start_adv_ext.sc
IMPORT: hci_connected.sc
#ignore adv set terminate
RECV: 04 3E 06 12 00 {adv_handle,1} {CON_HDL} {num_evt,1}

# period adv set info transfer
DELAY: 1500
DEFINE: service_data, BYTE, ABCD
SEND: 01 5B 20 05 {CON_HDL} {service_data} {period_adv_handle}
RECV: 04 0E 06 05 5B 20 00 {CON_HDL}
# ignore data length change
IGNORE: 04 3E {l,1} 07 {_,0}

DELAY: 5000
IMPORT: hci_disconnect.sc
IMPORT: hci_disconnected.sc
