
module n64_serial_interface(
    input clk,
    input polling_enable,
    input controller_reset,
    inout fab_pin,
    output reg [31:0] button_data,

    //DEBUG
    output wire read_data_bit,
    output wire read_bit_data_valid
);

// used by the sync and count block
reg data_in;  // use this for the read module's input
reg [1:0] sync_reg;
reg [23:0] long_count; // for 1ms polling

// used by the reset block
reg prev_reset = 0;
reg send_reset = 0; // use this to determine if reset should happen

// write/read module in/outputs
reg [7:0] command_byte; // input to write module
reg write_module_begin; // high one cycle, starts the write module
wire write_module_active; // high while write module is writing
wire data_out; // data out from the write module

wire read_module_begin; // active signal to the read module, from write module(1 cycle)

wire [31:0] button_data_raw; // since this changes, needs to write to button_data atomically
wire read_module_active;
wire read_module_error;



//reg write_module_set_enabled = 0; // tracks that it has been enabled
reg read_module_set_enabled = 0; // stays high to check falling edge

// write module
n64_write_command write_module(
    write_module_begin,
    clk,
    command_byte,
    write_module_active,
    data_out,
    read_module_begin
);

// read module
n64_read_module read_module(
    read_module_begin,
    clk,
    data_in,
    read_module_error,
    read_module_active,
    button_data_raw,
    read_data_bit,
    read_bit_data_valid
);

// open collector output circuit
//assign fab_pin = (write_module_set_enabled & ~data_out) ? 1'b0 : 1'bZ;
assign fab_pin = (write_module_active & ~data_out) ? 1'b0 : 1'bZ;

// utility functions
always @ (posedge clk) begin
    // Sync the data in line
    sync_reg[0] <= fab_pin;
    sync_reg[1] <= sync_reg[0];
    data_in <= sync_reg[1];

    // 1ms polling counter
    if (long_count < 100000)
        long_count <= long_count + 1;
    else
        long_count <= 0;

    // handles whether to write reset to controller or not
    if (prev_reset == 0 && controller_reset == 1)
        send_reset <= 1;
    else
        send_reset <= 0;

    prev_reset <= controller_reset;
end


// Request and Recieve state logic
always @ (posedge clk) begin

    // enable the write module condition
    if (polling_enable && (long_count == 0)) begin

        write_module_begin <= 1;  // wire into module to start it
        //write_module_set_enabled <= 1; // reg to catch falling edge

        if (send_reset)
            command_byte <= 8'hFF; // reset controller
        else
            command_byte <= 8'h01; // get buttons
    end

    // write_module_begin is the single pulse start signal
    if (write_module_begin) begin
        write_module_begin <= 0;
    end

    // detects falling edge of the write command module (also reset or not)
    //if (write_module_set_enabled & ~write_module_active) begin
        //write_module_set_enabled <= 0;
    //end

    // read module started by the write module, make sure to grab the init
    // then check for the ending condition
    if (read_module_begin) begin
        read_module_set_enabled <= 1;
    end
    else if (read_module_set_enabled & ~read_module_active) begin
        read_module_set_enabled <= 0;

        // if there was no error, write the button data to the output reg
        if (~read_module_error)
            button_data <= button_data_raw;
    end
end

endmodule

