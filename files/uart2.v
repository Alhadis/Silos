 
 
 module uart2(
  input        clk50,
  input        rst_n,
  input  [3:0] uart_baud,
  input        rx_in,
  output [7:0] rx_data,
  output       rx_empty,
  input  [7:0] tx_data,
  output reg   tx_out,  
  output [7:0] test
);


//parameters below specifies the 
  parameter UART_4800  = 10416;    // Option 3 multiply by 12
  parameter UART_9600  =  5208;    // Option 2 Multiply by 6
  parameter UART_19200 =  2604;    // Option 1 Multiply by 3
  parameter UART_57600 =   108;    // Option 0 Multiply by 1
  parameter UART_115200 =  54; 
  
  
  reg [15:0] clk50_cntr; //16 bit counter value
  reg        rx_d1;
  reg        rx_d2;
  reg        rx_d3;
  reg [15:0] sample_reg; //16 bit sample register
  reg [10:0] rx_reg;
  reg [2:0]  sample_cnt;
  reg [2:0]  sample_cnt_rx;
  reg [2:0]  sample_cnt_tx;
  reg [3:0]  bit_cnt;
  reg        sample_edge;
  reg        rx_on;
  reg        rx_on_d1;
  reg        rx_on_d2;
  wire       rx_on_edge;  
  reg [7:0]  tx_data_d1;
  reg [10:0] tx_data_reg;
  reg        tx_data_written;
  wire       tx_data_parity;
  reg [3:0]  bit_cnt_tx;
  reg        tx_on;
    
  
  wire start_bit,stop_bit;