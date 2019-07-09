`include "para_def.v"
module stage3_field_reg_module ( rst_n , clk , 

                                 BT8_in , PID1_in , MC1_in , MT1_in , 
                                 SS5_in , EB3_in , SPDC1_in , SP4_in , V4_in , PPDC1_in , PP4_in , TI4_in , 
                                 OIV4_in , 
                                 BP4_in , BS4_in , OP4_in , OS4_in , 
                                 SS4_in , SP2_in , BP2_in , BS2_in , OP2_in , OS2_in , 
                                 BSN4_in , EBSN4_in , RBSN4_in , MC8_in , 
                                 
                                 BT8_out , PID1_out , MC1_out , MT1_out , 
                                 SS5_out , EB3_out , SPDC1_out , SP4_out , V4_out , PPDC1_out , PP4_out , TI4_out ,
                                 OIV4_out , 
                                 BP4_out , BS4_out , OP4_out , OS4_out , 
                                 SS4_out , SP2_out , BP2_out , BS2_out , OP2_out , OS2_out , 
                                 BSN4_out , EBSN4_out , RBSN4_out , MC8_out 
                                 );
    input  rst_n , clk , 
           BT8_in , PID1_in , MC1_in , MT1_in ,
           SS5_in , EB3_in , SPDC1_in , SP4_in , V4_in , PPDC1_in , PP4_in , TI4_in , 
           OIV4_in , 
           BP4_in , BS4_in , OP4_in , OS4_in , 
           SS4_in , SP2_in , BP2_in , BS2_in , OP2_in , OS2_in , 
           BSN4_in , EBSN4_in , RBSN4_in , MC8_in ;
    
    output BT8_out , PID1_out , MC1_out , MT1_out ,
           SS5_out , EB3_out , SPDC1_out , SP4_out , V4_out , PPDC1_out , PP4_out , TI4_out , 
           OIV4_out , 
           BP4_out , BS4_out , OP4_out , OS4_out , 
           SS4_out , SP2_out , BP2_out , BS2_out , OP2_out , OS2_out , 
           BSN4_out , EBSN4_out , RBSN4_out , MC8_out ;
    
    wire                               rst_n , clk ;
    wire [ `field_BT8_bits - 1 : 0 ]   BT8_in ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_in ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_in ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_in ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_in ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_in ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_in ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_in ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_in ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_in ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_in ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_in ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_in ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_in ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_in ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_in ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_in ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_in ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_in ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_in ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_in ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_in ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_in ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_in ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_in ;
    
    wire [ `field_BT8_bits - 1 : 0 ]   BT8_out ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_out ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_out ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_out ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_out ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_out ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_out ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_out ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_out ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_out ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_out ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_out ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_out ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_out ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_out ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_out ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_out ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_out ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_out ;
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BT8_bits )
      )
      field_BT8_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BT8_in ),
       .q      ( BT8_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PID1_bits )
      )
      field_PID1_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PID1_in ),
       .q      ( PID1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC1_bits )
      )
      field_MC1_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC1_in ),
       .q      ( MC1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MT1_bits )
      )
      field_MT1_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MT1_in ),
       .q      ( MT1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS5_bits )
      )
      field_SS5_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS5_in ),
       .q      ( SS5_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EB3_bits )
      )
      field_EB3_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EB3_in ),
       .q      ( EB3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SPDC1_bits )
      )
      field_SPDC1_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SPDC1_in ),
       .q      ( SPDC1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP4_bits )
      )
      field_SP4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP4_in ),
       .q      ( SP4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_V4_bits )
      )
      field_V4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( V4_in ),
       .q      ( V4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PPDC1_bits )
      )
      field_PPDC1_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PPDC1_in ),
       .q      ( PPDC1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PP4_bits )
      )
      field_PP4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PP4_in ),
       .q      ( PP4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_TI4_bits )
      )
      field_TI4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( TI4_in ),
       .q      ( TI4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OIV4_bits )
      )
      field_OIV4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OIV4_in ),
       .q      ( OIV4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP4_bits )
      )
      field_BP4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP4_in ),
       .q      ( BP4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS4_bits )
      )
      field_BS4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS4_in ),
       .q      ( BS4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP4_bits )
      )
      field_OP4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP4_in ),
       .q      ( OP4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS4_bits )
      )
      field_OS4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS4_in ),
       .q      ( OS4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS4_bits )
      )
      field_SS4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS4_in ),
       .q      ( SS4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP2_bits )
      )
      field_SP2_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP2_in ),
       .q      ( SP2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP2_bits )
      )
      field_BP2_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP2_in ),
       .q      ( BP2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS2_bits )
      )
      field_BS2_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS2_in ),
       .q      ( BS2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP2_bits )
      )
      field_OP2_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP2_in ),
       .q      ( OP2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS2_bits )
      )
      field_OS2_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS2_in ),
       .q      ( OS2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BSN4_bits )
      )
      field_BSN4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BSN4_in ),
       .q      ( BSN4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EBSN4_bits )
      )
      field_EBSN4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EBSN4_in ),
       .q      ( EBSN4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_RBSN4_bits )
      )
      field_RBSN4_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( RBSN4_in ),
       .q      ( RBSN4_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC8_bits )
      )
      field_MC8_data_reg_3
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC8_in ),
       .q      ( MC8_out )
      );
    
endmodule
