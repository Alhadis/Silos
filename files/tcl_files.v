/*

restart
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/DATA_WIDTH \
sim:/bus_top_module_simulating_v3/ADDRS_WIDTH \
sim:/bus_top_module_simulating_v3/TIMEOUT_LEN \
sim:/bus_top_module_simulating_v3/BIT_LENGTH \
sim:/bus_top_module_simulating_v3/CLK_PERIOD \
sim:/bus_top_module_simulating_v3/MSTR3_ADDRS \
sim:/bus_top_module_simulating_v3/MSTR4_ADDRS \
sim:/bus_top_module_simulating_v3/MSTR5_ADDRS \
sim:/bus_top_module_simulating_v3/MSTR6_ADDRS \
sim:/bus_top_module_simulating_v3/MSTR8_ADDRS \
sim:/bus_top_module_simulating_v3/MSTR3_DIN \
sim:/bus_top_module_simulating_v3/MSTR4_DIN \
sim:/bus_top_module_simulating_v3/MSTR5_DIN \
sim:/bus_top_module_simulating_v3/MSTR6_DIN \
sim:/bus_top_module_simulating_v3/MSTR8_DIN \
sim:/bus_top_module_simulating_v3/SLAVE1_ID \
sim:/bus_top_module_simulating_v3/SLAVE2_ID \
sim:/bus_top_module_simulating_v3/SLAVE3_ID \
sim:/bus_top_module_simulating_v3/SLAVE4_ID \
sim:/bus_top_module_simulating_v3/SLAVE5_ID \
sim:/bus_top_module_simulating_v3/in_clk \
sim:/bus_top_module_simulating_v3/rstn \
sim:/bus_top_module_simulating_v3/freeze_slv1 \
sim:/bus_top_module_simulating_v3/freeze_slv2 \
sim:/bus_top_module_simulating_v3/rx0 \
sim:/bus_top_module_simulating_v3/rx1 \
sim:/bus_top_module_simulating_v3/master3_hold \
sim:/bus_top_module_simulating_v3/master4_hold \
sim:/bus_top_module_simulating_v3/master5_hold \
sim:/bus_top_module_simulating_v3/master6_hold \
sim:/bus_top_module_simulating_v3/master8_hold \
sim:/bus_top_module_simulating_v3/master_hold_common_P1P2 \
sim:/bus_top_module_simulating_v3/master_hold_common_P2P2 \
sim:/bus_top_module_simulating_v3/master_ex \
sim:/bus_top_module_simulating_v3/master_RW
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/BUS \
sim:/bus_top_module_simulating_v3/tx0 \
sim:/bus_top_module_simulating_v3/tx1
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/requests \
sim:/bus_top_module_simulating_v3/utilization \
sim:/bus_top_module_simulating_v3/slave_busy
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/clk
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/b_BUS \
sim:/bus_top_module_simulating_v3/b_RW
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/m_reqs \
sim:/bus_top_module_simulating_v3/m_grants \
sim:/bus_top_module_simulating_v3/slave2arbiter \
sim:/bus_top_module_simulating_v3/arbiter2slave \
sim:/bus_top_module_simulating_v3/mid_current
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/m_master_bsy0 \
sim:/bus_top_module_simulating_v3/m_master_bsy1 \
sim:/bus_top_module_simulating_v3/m_master_bsy2 \
sim:/bus_top_module_simulating_v3/m_master_bsy3 \
sim:/bus_top_module_simulating_v3/m_master_bsy4 \
sim:/bus_top_module_simulating_v3/m_master_bsy5 \
sim:/bus_top_module_simulating_v3/m_master_bsy6 \
sim:/bus_top_module_simulating_v3/m_master_bsy8
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/m_dvalid3 \
sim:/bus_top_module_simulating_v3/m_dvalid4 \
sim:/bus_top_module_simulating_v3/m_dvalid5 \
sim:/bus_top_module_simulating_v3/m_dvalid6 \
sim:/bus_top_module_simulating_v3/m_dvalid8
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/m_dout3 \
sim:/bus_top_module_simulating_v3/m_dout4 \
sim:/bus_top_module_simulating_v3/m_dout5 \
sim:/bus_top_module_simulating_v3/m_dout6 \
sim:/bus_top_module_simulating_v3/m_dout8
add wave -position insertpoint  \
sim:/bus_top_module_simulating_v3/st_arb \
sim:/bus_top_module_simulating_v3/st_ms0 \
sim:/bus_top_module_simulating_v3/st_ms1 \
sim:/bus_top_module_simulating_v3/st_ms2 \
sim:/bus_top_module_simulating_v3/st_ms3 \
sim:/bus_top_module_simulating_v3/st_ms4 \
sim:/bus_top_module_simulating_v3/st_ms5 \
sim:/bus_top_module_simulating_v3/st_ms6 \
sim:/bus_top_module_simulating_v3/st_ms8 \
sim:/bus_top_module_simulating_v3/st_slv0 \
sim:/bus_top_module_simulating_v3/st_slv1 \
sim:/bus_top_module_simulating_v3/st_slv2 \
sim:/bus_top_module_simulating_v3/st_slv3 \
sim:/bus_top_module_simulating_v3/st_slv4 \
sim:/bus_top_module_simulating_v3/st_slv5 \
sim:/bus_top_module_simulating_v3/st_int0 \
sim:/bus_top_module_simulating_v3/st_int1




run 100ns
force -freeze sim:/bus_top_module_simulating_v3/in_clk 1 0, 0 {50000 ps} -r 100ns
force -freeze sim:/bus_top_module_simulating_v3/rstn 1 0
force -freeze sim:/bus_top_module_simulating_v3/freeze_slv1 0 0
force -freeze sim:/bus_top_module_simulating_v3/freeze_slv2 0 0
force -freeze sim:/bus_top_module_simulating_v3/rx0 1 0
force -freeze sim:/bus_top_module_simulating_v3/rx1 1 0
force -freeze sim:/bus_top_module_simulating_v3/master3_hold 0 0
force -freeze sim:/bus_top_module_simulating_v3/master4_hold 0 0
force -freeze sim:/bus_top_module_simulating_v3/master5_hold HiZ 0
force -freeze sim:/bus_top_module_simulating_v3/master6_hold 0 0
force -freeze sim:/bus_top_module_simulating_v3/master8_hold 0 0
force -freeze sim:/bus_top_module_simulating_v3/master5_hold 0 0
force -freeze sim:/bus_top_module_simulating_v3/master_hold_common_P1P2 0 0
force -freeze sim:/bus_top_module_simulating_v3/master_hold_common_P2P2 0 0
force -freeze sim:/bus_top_module_simulating_v3/master_ex 0 0
force -freeze sim:/bus_top_module_simulating_v3/master_RW 0 0
run 100ns


force -freeze sim:/bus_top_module_simulating_v3/rstn 0 0;run 300ns
force -freeze sim:/bus_top_module_simulating_v3/rstn 1 0;run 300ns


force -freeze sim:/bus_top_module_simulating_v3/master4_hold 1 0
run 100ns
run 100ns
run 100ns
run 100ns
run 100ns
run 100ns
run 100ns
force -freeze sim:/bus_top_module_simulating_v3/freeze_slv2 1 0
run  100ns
run  100ns
force -freeze sim:/bus_top_module_simulating_v3/master_ex 1 0
run 100ns
force -freeze sim:/bus_top_module_simulating_v3/master_ex 0 0
run 400ns
force -freeze sim:/bus_top_module_simulating_v3/master6_hold 1 0
force -freeze sim:/bus_top_module_simulating_v3/master_RW 1 0
run 7000ns
force -freeze sim:/bus_top_module_simulating_v3/master_ex 1 0
run 100ns
force -freeze sim:/bus_top_module_simulating_v3/master_ex 0 0
run 800ns

force -freeze sim:/bus_top_module_simulating_v3/master_ex 1 0
run 100ns
force -freeze sim:/bus_top_module_simulating_v3/master_ex 0 0
run 800ns
run 5200ns
force -freeze sim:/bus_top_module_simulating_v3/freeze_slv2 0 0
run 4800ns


*/