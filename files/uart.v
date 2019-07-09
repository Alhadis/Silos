// UART module with 1 stop bit and no parity bit
module uart
    #(
        parameter CLK_FREQ_HZ = 10000000, // frequency of 'clk' in Hz
        parameter BAUD_RATE = 115200, // rate at which data is transmitted/received
        parameter DATA_BITS = 8
    )
    (
        input clk,
        input tx_valid, // asserted HIGH when there is valid data to send
        input [DATA_BITS-1:0] tx_data_parallel,
        input rx_data_serial,
        output reg rx_valid = 0, // asserted HIGH when data reception is finished
        output reg tx_data_serial, // serialized TX data
        output [DATA_BITS-1:0] rx_data_parallel // deserialized RX data
    );
    
    localparam TICKS_PER_PULSE = CLK_FREQ_HZ/BAUD_RATE;
    localparam TICKS_TO_PULSE_CENTER = TICKS_PER_PULSE/2;
    localparam IDLE = 0;
    localparam START = 1;
    localparam DATA = 2;
    localparam STOP = 3;
    
    reg rx_data_serial_temp;
    reg rx_data_serial_stable;
    reg rx_data_serial_previous;
    reg [1:0] rx_state = IDLE;
    reg [1:0] tx_state = IDLE;
    reg [DATA_BITS-1:0] rx_buffer;
    reg [DATA_BITS-1:0] tx_buffer;
    reg [$clog2(DATA_BITS)-1:0] rx_bit_count = 0;
    reg [$clog2(DATA_BITS)-1:0] tx_bit_count = 0;
    reg [$clog2(TICKS_PER_PULSE)-1:0] rx_tick_count = 0;
    reg [$clog2(TICKS_PER_PULSE)-1:0] tx_tick_count = 0;
    
    // register the incoming data using two flip-flops to avoid metastability issues
    always @(posedge clk) begin
        rx_data_serial_temp <= rx_data_serial;
        rx_data_serial_stable <= rx_data_serial_temp;
        rx_data_serial_previous <= rx_data_serial_stable;
    end
    
    // RX state machine
    always @(posedge clk)
        case(rx_state)
            IDLE: begin
                rx_valid <= 0;
                rx_bit_count <= 0;
                rx_tick_count <= TICKS_TO_PULSE_CENTER;
                /*
                    the data will be sampled at the center of each pulse
                    starting the counter from TICKS_TO_PULSE_CENTER causes state change just after the data is written to buffer
                    this saves us from using separate comparators for state change and write operation
                */
                if(~rx_data_serial_stable && rx_data_serial_previous) // the line goes LOW, data is coming
                    rx_state <= START;
                else
                    rx_state <= IDLE;
            end
            START:
                if(rx_tick_count < TICKS_PER_PULSE - 1) begin
                    rx_state <= START;
                    rx_tick_count <= rx_tick_count + 1;
                end else begin
                    rx_state <= DATA;
                    rx_tick_count <= 0;
                end
            DATA:
                if(rx_tick_count < TICKS_PER_PULSE - 1) begin
                    rx_state <= DATA;
                    rx_tick_count <= rx_tick_count + 1;
                end else begin
                    rx_tick_count <= 0;
                    rx_buffer[rx_bit_count] <= rx_data_serial_stable;
                    if(rx_bit_count < DATA_BITS - 1) begin
                        rx_state <= DATA;
                        rx_bit_count <= rx_bit_count + 1;
                    end else
                        rx_state <= STOP;
                end
            STOP:
                if(rx_tick_count < TICKS_PER_PULSE - 1) begin
                    rx_tick_count <= rx_tick_count + 1;
                    rx_state <= STOP;
                    rx_valid <= 0;
                end else begin
                    rx_tick_count <= 0;
                    rx_valid <= 1; // data is received
                    rx_state <= IDLE;
                end
            default: begin
                rx_state <= IDLE;
            end
        endcase
    
    assign rx_data_parallel = rx_buffer;

    // TX state machine
    always @(posedge clk)
        case(tx_state)
            IDLE: begin
                tx_data_serial <= 1;
                tx_bit_count <= 0;
                tx_tick_count <= 0;
                if(tx_valid) begin
                    tx_state <= START;
                    tx_buffer <= tx_data_parallel; // load data to be transmitted into tx_buffer
                end else
                    tx_state <= IDLE;
            end
            START: begin
                tx_data_serial <= 0;
                if(tx_tick_count < TICKS_PER_PULSE - 1) begin
                    tx_state <= START;
                    tx_tick_count <= tx_tick_count + 1;
                end else begin
                    tx_state <= DATA;
                    tx_tick_count <= 0;
                end
            end
            DATA: begin
                tx_data_serial <= tx_buffer[tx_bit_count];
                if(tx_tick_count < TICKS_PER_PULSE - 1) begin
                    tx_state <= DATA;
                    tx_tick_count <= tx_tick_count + 1;
                end else begin
                    tx_tick_count <= 0;
                    if(tx_bit_count < DATA_BITS - 1) begin
                        tx_state <= DATA;
                        tx_bit_count <= tx_bit_count + 1;
                    end else
                        tx_state <= STOP;
                end
            end
            STOP: begin
                tx_data_serial <= 1;
                if(tx_tick_count < TICKS_PER_PULSE - 1) begin
                    tx_tick_count <= tx_tick_count + 1;
                    tx_state <= STOP;
                end else begin
                    tx_tick_count <= 0;
                    tx_state <= IDLE;
                end
            end
            default: begin
                tx_data_serial <= 1;
                tx_state <= IDLE;
            end
        endcase
        
endmodule
