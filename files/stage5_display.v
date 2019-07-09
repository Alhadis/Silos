`include "para_def.v"
module stage5_display_module ( 
                                        rst_n , clk ,
                                        message_en_in , 
                                        PID1_1_in , MC1_1_in , MT1_1_in , 
                                        SS5_1_in , EB3_1_in , SPDC1_1_in , SP4_1_in , V4_1_in , PPDC1_1_in , PP4_1_in , TI4_1_in , 
                                        OIV4_1_in , 
                                        BP4_1_in , BS4_1_in , OP4_1_in , OS4_1_in , 
                                        SS4_1_in , SP2_1_in , BP2_1_in , BS2_1_in , OP2_1_in , OS2_1_in , 
                                        BSN4_1_in , EBSN4_1_in , RBSN4_1_in , MC8_1_in ,
                                        PID1_2_in , MC1_2_in , MT1_2_in , 
                                        SS5_2_in , EB3_2_in , SPDC1_2_in , SP4_2_in , V4_2_in , PPDC1_2_in , PP4_2_in , TI4_2_in , 
                                        OIV4_2_in , 
                                        BP4_2_in , BS4_2_in , OP4_2_in , OS4_2_in , 
                                        SS4_2_in , SP2_2_in , BP2_2_in , BS2_2_in , OP2_2_in , OS2_2_in , 
                                        BSN4_2_in , EBSN4_2_in , RBSN4_2_in , MC8_2_in ,
                                        PID1_3_in , MC1_3_in , MT1_3_in , 
                                        SS5_3_in , EB3_3_in , SPDC1_3_in , SP4_3_in , V4_3_in , PPDC1_3_in , PP4_3_in , TI4_3_in , 
                                        OIV4_3_in , 
                                        BP4_3_in , BS4_3_in , OP4_3_in , OS4_3_in , 
                                        SS4_3_in , SP2_3_in , BP2_3_in , BS2_3_in , OP2_3_in , OS2_3_in , 
                                        BSN4_3_in , EBSN4_3_in , RBSN4_3_in , MC8_3_in ,
                                        
                                        message_en_out , 
                                        PID1_1_out , MC1_1_out , MT1_1_out , 
                                        SS5_1_out , EB3_1_out , SPDC1_1_out , SP4_1_out , V4_1_out , PPDC1_1_out , PP4_1_out , TI4_1_out ,
                                        OIV4_1_out , 
                                        BP4_1_out , BS4_1_out , OP4_1_out , OS4_1_out , 
                                        SS4_1_out , SP2_1_out , BP2_1_out , BS2_1_out , OP2_1_out , OS2_1_out , 
                                        BSN4_1_out , EBSN4_1_out , RBSN4_1_out , MC8_1_out , 
                                        PID1_2_out , MC1_2_out , MT1_2_out , 
                                        SS5_2_out , EB3_2_out , SPDC1_2_out , SP4_2_out , V4_2_out , PPDC1_2_out , PP4_2_out , TI4_2_out ,
                                        OIV4_2_out , 
                                        BP4_2_out , BS4_2_out , OP4_2_out , OS4_2_out , 
                                        SS4_2_out , SP2_2_out , BP2_2_out , BS2_2_out , OP2_2_out , OS2_2_out , 
                                        BSN4_2_out , EBSN4_2_out , RBSN4_2_out , MC8_2_out , 
                                        PID1_3_out , MC1_3_out , MT1_3_out , 
                                        SS5_3_out , EB3_3_out , SPDC1_3_out , SP4_3_out , V4_3_out , PPDC1_3_out , PP4_3_out , TI4_3_out ,
                                        OIV4_3_out , 
                                        BP4_3_out , BS4_3_out , OP4_3_out , OS4_3_out , 
                                        SS4_3_out , SP2_3_out , BP2_3_out , BS2_3_out , OP2_3_out , OS2_3_out , 
                                        BSN4_3_out , EBSN4_3_out , RBSN4_3_out , MC8_3_out 
                                        );
    input  rst_n , clk ,
           message_en_in ,  
           PID1_1_in , MC1_1_in , MT1_1_in ,
           SS5_1_in , EB3_1_in , SPDC1_1_in , SP4_1_in , V4_1_in , PPDC1_1_in , PP4_1_in , TI4_1_in , 
           OIV4_1_in , 
           BP4_1_in , BS4_1_in , OP4_1_in , OS4_1_in , 
           SS4_1_in , SP2_1_in , BP2_1_in , BS2_1_in , OP2_1_in , OS2_1_in , 
           BSN4_1_in , EBSN4_1_in , RBSN4_1_in , MC8_1_in , 
           PID1_2_in , MC1_2_in , MT1_2_in ,
           SS5_2_in , EB3_2_in , SPDC1_2_in , SP4_2_in , V4_2_in , PPDC1_2_in , PP4_2_in , TI4_2_in , 
           OIV4_2_in , 
           BP4_2_in , BS4_2_in , OP4_2_in , OS4_2_in , 
           SS4_2_in , SP2_2_in , BP2_2_in , BS2_2_in , OP2_2_in , OS2_2_in , 
           BSN4_2_in , EBSN4_2_in , RBSN4_2_in , MC8_2_in , 
           PID1_3_in , MC1_3_in , MT1_3_in ,
           SS5_3_in , EB3_3_in , SPDC1_3_in , SP4_3_in , V4_3_in , PPDC1_3_in , PP4_3_in , TI4_3_in , 
           OIV4_3_in , 
           BP4_3_in , BS4_3_in , OP4_3_in , OS4_3_in , 
           SS4_3_in , SP2_3_in , BP2_3_in , BS2_3_in , OP2_3_in , OS2_3_in , 
           BSN4_3_in , EBSN4_3_in , RBSN4_3_in , MC8_3_in ;
   output  message_en_out , 
           PID1_1_out , MC1_1_out , MT1_1_out ,
           SS5_1_out , EB3_1_out , SPDC1_1_out , SP4_1_out , V4_1_out , PPDC1_1_out , PP4_1_out , TI4_1_out , 
           OIV4_1_out , 
           BP4_1_out , BS4_1_out , OP4_1_out , OS4_1_out , 
           SS4_1_out , SP2_1_out , BP2_1_out , BS2_1_out , OP2_1_out , OS2_1_out , 
           BSN4_1_out , EBSN4_1_out , RBSN4_1_out , MC8_1_out , 
           PID1_2_out , MC1_2_out , MT1_2_out ,
           SS5_2_out , EB3_2_out , SPDC1_2_out , SP4_2_out , V4_2_out , PPDC1_2_out , PP4_2_out , TI4_2_out , 
           OIV4_2_out , 
           BP4_2_out , BS4_2_out , OP4_2_out , OS4_2_out , 
           SS4_2_out , SP2_2_out , BP2_2_out , BS2_2_out , OP2_2_out , OS2_2_out , 
           BSN4_2_out , EBSN4_2_out , RBSN4_2_out , MC8_2_out , 
           PID1_3_out , MC1_3_out , MT1_3_out ,
           SS5_3_out , EB3_3_out , SPDC1_3_out , SP4_3_out , V4_3_out , PPDC1_3_out , PP4_3_out , TI4_3_out , 
           OIV4_3_out , 
           BP4_3_out , BS4_3_out , OP4_3_out , OS4_3_out , 
           SS4_3_out , SP2_3_out , BP2_3_out , BS2_3_out , OP2_3_out , OS2_3_out , 
           BSN4_3_out , EBSN4_3_out , RBSN4_3_out , MC8_3_out ;
    
    wire                               rst_n , clk ;
    wire                               message_en_in ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_1_in ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_1_in ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_1_in ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_1_in ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_1_in ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_1_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_1_in ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_1_in ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_1_in ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_1_in ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_1_in ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_1_in ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_1_in ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_1_in ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_1_in ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_1_in ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_1_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_1_in ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_1_in ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_1_in ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_1_in ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_1_in ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_1_in ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_1_in ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_1_in ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_1_in ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_2_in ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_2_in ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_2_in ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_2_in ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_2_in ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_2_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_2_in ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_2_in ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_2_in ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_2_in ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_2_in ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_2_in ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_2_in ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_2_in ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_2_in ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_2_in ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_2_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_2_in ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_2_in ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_2_in ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_2_in ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_2_in ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_2_in ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_2_in ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_2_in ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_2_in ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_3_in ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_3_in ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_3_in ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_3_in ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_3_in ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_3_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_3_in ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_3_in ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_3_in ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_3_in ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_3_in ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_3_in ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_3_in ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_3_in ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_3_in ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_3_in ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_3_in ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_3_in ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_3_in ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_3_in ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_3_in ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_3_in ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_3_in ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_3_in ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_3_in ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_3_in ;
    
    wire                               message_en_out ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_1_out ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_1_out ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_1_out ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_1_out ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_1_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_1_out ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_1_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_1_out ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_1_out ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_1_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_1_out ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_1_out ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_1_out ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_1_out ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_1_out ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_1_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_1_out ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_1_out ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_1_out ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_1_out ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_1_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_1_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_1_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_1_out ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_1_out ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_2_out ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_2_out ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_2_out ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_2_out ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_2_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_2_out ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_2_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_2_out ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_2_out ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_2_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_2_out ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_2_out ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_2_out ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_2_out ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_2_out ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_2_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_2_out ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_2_out ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_2_out ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_2_out ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_2_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_2_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_2_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_2_out ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_2_out ;
    wire [ `field_PID1_bits - 1 : 0 ]  PID1_3_out ;
    wire [ `field_MC1_bits - 1 : 0 ]   MC1_3_out ;
    wire [ `field_MT1_bits - 1 : 0 ]   MT1_3_out ;
    wire [ `field_SS5_bits - 1 : 0 ]   SS5_3_out ;
    wire [ `field_EB3_bits - 1 : 0 ]   EB3_3_out ;
    wire [ `field_SPDC1_bits - 1 : 0 ] SPDC1_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP4_3_out ;
    wire [ `field_V4_bits - 1 : 0 ]    V4_3_out ;
    wire [ `field_PPDC1_bits - 1 : 0 ] PPDC1_3_out ;
    wire [ `field_PP4_bits - 1 : 0 ]   PP4_3_out ;
    wire [ `field_TI4_bits - 1 : 0 ]   TI4_3_out ;
    wire [ `field_OIV4_bits - 1 : 0 ]  OIV4_3_out ;
    wire [ `field_BP4_bits - 1 : 0 ]   BP4_3_out ;
    wire [ `field_BS4_bits - 1 : 0 ]   BS4_3_out ;
    wire [ `field_OP4_bits - 1 : 0 ]   OP4_3_out ;
    wire [ `field_OS4_bits - 1 : 0 ]   OS4_3_out ;
    wire [ `field_SS4_bits - 1 : 0 ]   SS4_3_out ;
    wire [ `field_SP4_bits - 1 : 0 ]   SP2_3_out ;
    wire [ `field_BP2_bits - 1 : 0 ]   BP2_3_out ;
    wire [ `field_BS2_bits - 1 : 0 ]   BS2_3_out ;
    wire [ `field_OP2_bits - 1 : 0 ]   OP2_3_out ;
    wire [ `field_OS2_bits - 1 : 0 ]   OS2_3_out ;
    wire [ `field_BSN4_bits - 1 : 0 ]  BSN4_3_out ;
    wire [ `field_EBSN4_bits - 1 : 0 ] EBSN4_3_out ;
    wire [ `field_RBSN4_bits - 1 : 0 ] RBSN4_3_out ;
    wire [ `field_MC8_bits - 1 : 0 ]   MC8_3_out ;
    
    reg_m_module # 
      (
       .REG_WIDTH   ( 1 )
      )
      message_en_reg_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_en_in ),
       .q      ( message_en_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PID1_bits )
      )
      field_PID1_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PID1_1_in ),
       .q      ( PID1_1_out )
      );
      
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC1_bits )
      )
      field_MC1_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC1_1_in ),
       .q      ( MC1_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MT1_bits )
      )
      field_MT1_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MT1_1_in ),
       .q      ( MT1_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS5_bits )
      )
      field_SS5_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS5_1_in ),
       .q      ( SS5_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EB3_bits )
      )
      field_EB3_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EB3_1_in ),
       .q      ( EB3_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SPDC1_bits )
      )
      field_SPDC1_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SPDC1_1_in ),
       .q      ( SPDC1_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP4_bits )
      )
      field_SP4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP4_1_in ),
       .q      ( SP4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_V4_bits )
      )
      field_V4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( V4_1_in ),
       .q      ( V4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PPDC1_bits )
      )
      field_PPDC1_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PPDC1_1_in ),
       .q      ( PPDC1_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PP4_bits )
      )
      field_PP4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PP4_1_in ),
       .q      ( PP4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_TI4_bits )
      )
      field_TI4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( TI4_1_in ),
       .q      ( TI4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OIV4_bits )
      )
      field_OIV4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OIV4_1_in ),
       .q      ( OIV4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP4_bits )
      )
      field_BP4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP4_1_in ),
       .q      ( BP4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS4_bits )
      )
      field_BS4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS4_1_in ),
       .q      ( BS4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP4_bits )
      )
      field_OP4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP4_1_in ),
       .q      ( OP4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS4_bits )
      )
      field_OS4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS4_1_in ),
       .q      ( OS4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS4_bits )
      )
      field_SS4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS4_1_in ),
       .q      ( SS4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP2_bits )
      )
      field_SP2_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP2_1_in ),
       .q      ( SP2_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP2_bits )
      )
      field_BP2_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP2_1_in ),
       .q      ( BP2_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS2_bits )
      )
      field_BS2_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS2_1_in ),
       .q      ( BS2_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP2_bits )
      )
      field_OP2_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP2_1_in ),
       .q      ( OP2_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS2_bits )
      )
      field_OS2_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS2_1_in ),
       .q      ( OS2_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BSN4_bits )
      )
      field_BSN4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BSN4_1_in ),
       .q      ( BSN4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EBSN4_bits )
      )
      field_EBSN4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EBSN4_1_in ),
       .q      ( EBSN4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_RBSN4_bits )
      )
      field_RBSN4_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( RBSN4_1_in ),
       .q      ( RBSN4_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC8_bits )
      )
      field_MC8_data_reg1_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC8_1_in ),
       .q      ( MC8_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PID1_bits )
      )
      field_PID1_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PID1_2_in ),
       .q      ( PID1_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC1_bits )
      )
      field_MC1_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC1_2_in ),
       .q      ( MC1_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MT1_bits )
      )
      field_MT1_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MT1_2_in ),
       .q      ( MT1_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS5_bits )
      )
      field_SS5_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS5_2_in ),
       .q      ( SS5_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EB3_bits )
      )
      field_EB3_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EB3_2_in ),
       .q      ( EB3_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SPDC1_bits )
      )
      field_SPDC1_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SPDC1_2_in ),
       .q      ( SPDC1_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP4_bits )
      )
      field_SP4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP4_2_in ),
       .q      ( SP4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_V4_bits )
      )
      field_V4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( V4_2_in ),
       .q      ( V4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PPDC1_bits )
      )
      field_PPDC1_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PPDC1_2_in ),
       .q      ( PPDC1_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PP4_bits )
      )
      field_PP4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PP4_2_in ),
       .q      ( PP4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_TI4_bits )
      )
      field_TI4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( TI4_2_in ),
       .q      ( TI4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OIV4_bits )
      )
      field_OIV4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OIV4_2_in ),
       .q      ( OIV4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP4_bits )
      )
      field_BP4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP4_2_in ),
       .q      ( BP4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS4_bits )
      )
      field_BS4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS4_2_in ),
       .q      ( BS4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP4_bits )
      )
      field_OP4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP4_2_in ),
       .q      ( OP4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS4_bits )
      )
      field_OS4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS4_2_in ),
       .q      ( OS4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS4_bits )
      )
      field_SS4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS4_2_in ),
       .q      ( SS4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP2_bits )
      )
      field_SP2_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP2_2_in ),
       .q      ( SP2_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP2_bits )
      )
      field_BP2_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP2_2_in ),
       .q      ( BP2_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS2_bits )
      )
      field_BS2_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS2_2_in ),
       .q      ( BS2_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP2_bits )
      )
      field_OP2_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP2_2_in ),
       .q      ( OP2_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS2_bits )
      )
      field_OS2_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS2_2_in ),
       .q      ( OS2_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BSN4_bits )
      )
      field_BSN4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BSN4_2_in ),
       .q      ( BSN4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EBSN4_bits )
      )
      field_EBSN4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EBSN4_2_in ),
       .q      ( EBSN4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_RBSN4_bits )
      )
      field_RBSN4_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( RBSN4_2_in ),
       .q      ( RBSN4_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC8_bits )
      )
      field_MC8_data_reg2_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC8_2_in ),
       .q      ( MC8_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PID1_bits )
      )
      field_PID1_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PID1_3_in ),
       .q      ( PID1_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC1_bits )
      )
      field_MC1_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC1_3_in ),
       .q      ( MC1_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MT1_bits )
      )
      field_MT1_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MT1_3_in ),
       .q      ( MT1_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS5_bits )
      )
      field_SS5_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS5_3_in ),
       .q      ( SS5_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EB3_bits )
      )
      field_EB3_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EB3_3_in ),
       .q      ( EB3_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SPDC1_bits )
      )
      field_SPDC1_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SPDC1_3_in ),
       .q      ( SPDC1_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP4_bits )
      )
      field_SP4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP4_3_in ),
       .q      ( SP4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_V4_bits )
      )
      field_V4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( V4_3_in ),
       .q      ( V4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PPDC1_bits )
      )
      field_PPDC1_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PPDC1_3_in ),
       .q      ( PPDC1_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_PP4_bits )
      )
      field_PP4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( PP4_3_in ),
       .q      ( PP4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_TI4_bits )
      )
      field_TI4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( TI4_3_in ),
       .q      ( TI4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OIV4_bits )
      )
      field_OIV4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OIV4_3_in ),
       .q      ( OIV4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP4_bits )
      )
      field_BP4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP4_3_in ),
       .q      ( BP4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS4_bits )
      )
      field_BS4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS4_3_in ),
       .q      ( BS4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP4_bits )
      )
      field_OP4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP4_3_in ),
       .q      ( OP4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS4_bits )
      )
      field_OS4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS4_3_in ),
       .q      ( OS4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SS4_bits )
      )
      field_SS4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SS4_3_in ),
       .q      ( SS4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_SP2_bits )
      )
      field_SP2_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( SP2_3_in ),
       .q      ( SP2_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BP2_bits )
      )
      field_BP2_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BP2_3_in ),
       .q      ( BP2_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BS2_bits )
      )
      field_BS2_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BS2_3_in ),
       .q      ( BS2_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OP2_bits )
      )
      field_OP2_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OP2_3_in ),
       .q      ( OP2_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_OS2_bits )
      )
      field_OS2_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( OS2_3_in ),
       .q      ( OS2_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_BSN4_bits )
      )
      field_BSN4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( BSN4_3_in ),
       .q      ( BSN4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_EBSN4_bits )
      )
      field_EBSN4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( EBSN4_3_in ),
       .q      ( EBSN4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_RBSN4_bits )
      )
      field_RBSN4_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( RBSN4_3_in ),
       .q      ( RBSN4_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   ( `field_MC8_bits )
      )
      field_MC8_data_reg3_5
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( MC8_3_in ),
       .q      ( MC8_3_out )
      );
endmodule
