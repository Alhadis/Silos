/*
 *******************************************************************************
 *  File Name   :   ada_mem_decoder.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 19th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Basic interface to memory (internal/external/cache) and
 *                  devices
 *******************************************************************************
 */
`include "ada_defines.v"

`define IO_SPACE_SOURCE     2'b00
`define IMEM_SPACE_SOURCE   2'b01
`define EMEM_SPACE_SOURCE   2'b10
`define INVALID_SPACE       2'b11

module ada_mem_decoder(
    input               clk,
    input               rst,
    // IF interface
    input       [31:0]  imem_address,           // Instruction address
    output  reg [31:0]  imem_data,              // Instruction data
    // MEM interface
    input       [31:0]  dmem_address,           // Data address
    input       [31:0]  dmem_data_i,            // Data to memory
    input               data_word,              // word access
    input               data_halfword,          // halfword access
    input               data_byte,              // byte access
    input               dmem_read,              // read data memory
    input               dmem_write,             // write data memory
    input               data_sign_extend,       // read data (byte/half) with sign extended
    output  reg [31:0]  dmem_data_o,            // data from memory
    // I/O
    input       [31:0]  io_data_i,              // data from device
    input               io_ready,               // device is ready
    output      [31:0]  io_address,             // device address
    output      [31:0]  io_data_o,              // data to device
    output              io_we,                  // write to device
    output              io_enable,              // enable operation
    // Internal IM
    input       [31:0]  iimem_data_i,           // data from memory
    output      [31:0]  iimem_address,          // instruction address
    output              iimem_we,               // write enable
    // Internal DM
    input       [31:0]  dimem_data_i,           // data from memory
    output      [31:0]  dimem_address,          // instruction address
    output      [31:0]  dimem_data_o,           // data to memory
    output              dimem_we,               // write enable
    // External Instruction Memory/Instruction Cache
    input       [31:0]  eimem_cache_data_i,     // Data from memory
    input               eimem_cache_ready,      // memory is ready
    output      [31:0]  eimem_cache_address,    // data address
    output              eimem_cache_wr,         // write = 1, read = 0,
    output              eimem_cache_enable,     // enable operation
    // External Data Memory/Data Cache
    input       [31:0]  edmem_cache_data_i,     // Data from memory
    input               edmem_cache_ready,      // memory is ready
    output      [31:0]  edmem_cache_address,    // data address
    output      [31:0]  edmem_cache_data_o,     // data to memory
    output              edmem_cache_wr,         // write = 1, read = 0,
    output              edmem_cache_enable,     // enable operation
    // pipeline
    input               if_kernel_mode,         // privilege access in IF stage
    input               mem_kernel_mode,        // privilege access in MEM stage
    input               if_stall,               // Stop transactions if IF is stalled
    input               if_flush,               // abort IF
    output              exc_bad_if_address,     // panic
    output              exc_bad_mem_address,    // panic
    output              if_stall_md,            // long operation
    output              mem_stall_md            // long operation
    );

    //--------------------------------------------------------------------------
    // wire
    //--------------------------------------------------------------------------
    wire        exc_kernel_iaddress;           // Instruction address access kernel space
    wire        exc_invalid_word_iaddress;     // Not word-aligned instructions address
    wire        exc_invalid_space_iaddress;    // try to access I/O space

    wire        exc_kernel_daddress;           // Data address access kernel space
    wire        exc_invalid_word_maddress;     // Not word-aligned data address
    wire        exc_invalid_half_maddress;     // Not halfword-aligned data address

    wire [31:0] mem_data_write;                // Data out
    wire [7:0]  mem_hh;                        // In/Out, Data out byte 3
    wire [7:0]  mem_hl;                        // In/Out, Data out byte 2
    wire [7:0]  mem_lh;                        // In/Out, Data out byte 1
    wire [7:0]  mem_ll;                        // In/Out, Data out byte 0

    wire        dmem_operation;                // Read or Write?

    //--------------------------------------------------------------------------
    // registers
    //--------------------------------------------------------------------------
    reg [31:0]  physical_iaddress;              // real address
    reg [31:0]  physical_daddress;              // real address
    reg [1:0]   idata_selector;                 // select the data source
    reg [1:0]   ddata_selector;                 // select the data source
    reg [31:0]  data_memory;                    // data from data memory

    reg         iimem_ready;                    // Internal memory transaction is done
    reg         dimem_ready;                    // Internal memory transaction is done
    reg [1:0]   iimem_delay;                    // delay to read internal memory
    reg [1:0]   dimem_delay;                    // delay to read internal memory

    //--------------------------------------------------------------------------
    // assignments
    //--------------------------------------------------------------------------
    assign exc_kernel_iaddress        = ~if_kernel_mode & imem_address[31];                    // low 2GB is user space.
    assign exc_invalid_word_iaddress  = imem_address[1] | imem_address[0];                  // Bits 0 and 1 must be zeros
    assign exc_invalid_space_iaddress = (imem_address[31:29] == 3'b100) ? 1'b1 : 1'b0;      // No code at I/O space.

    assign exc_kernel_daddress        = ~mem_kernel_mode & dmem_address[31];                    // low 2GB is user space.
    assign exc_invalid_word_maddress  = (dmem_address[1] | dmem_address[0]) & data_word;    // word access. Bits 0 and 1 must be zeros
    assign exc_invalid_half_maddress  = dmem_address[0] & data_halfword;                    // halfword access. Bit 0 must be zero

    assign exc_bad_if_address         = exc_kernel_iaddress | exc_invalid_word_iaddress | exc_invalid_space_iaddress;
    assign exc_bad_mem_address        = (dmem_read | dmem_write) & (exc_kernel_daddress | exc_invalid_word_maddress | exc_invalid_half_maddress);

    assign mem_data_write             = {mem_hh, mem_hl, mem_lh, mem_ll};

    assign dmem_operation             = dmem_write ^ dmem_read;                             // only one

    assign if_stall_md                = (~iimem_ready & (idata_selector == `IMEM_SPACE_SOURCE)) | eimem_cache_enable;
    assign mem_stall_md               = io_enable | edmem_cache_enable | (~dimem_ready & (ddata_selector == `IMEM_SPACE_SOURCE) & dmem_operation);

    //--------------------------------------------------------------------------
    // Map address and I/O ports
    //--------------------------------------------------------------------------
    assign io_address          = physical_daddress;
    assign io_data_o           = mem_data_write;

    assign iimem_address       = physical_iaddress;

    assign dimem_address       = physical_daddress;
    assign dimem_data_o        = mem_data_write;

    assign eimem_cache_address = physical_iaddress;

    assign edmem_cache_address = physical_daddress;
    assign edmem_cache_data_o  = mem_data_write;

    //--------------------------------------------------------------------------
    // I/O
    // The ready signal is synchronous
    // Write enable only if read = 0 (10, not 11)
    // Enable operation only is ready signal is zero, R/W operation, no exceptions
    //      and address inside IO space.
    //--------------------------------------------------------------------------
    assign io_we     = dmem_write & ~dmem_read;
    assign io_enable = ~io_ready & dmem_operation & ~exc_bad_mem_address & (idata_selector == `IO_SPACE_SOURCE);

    //--------------------------------------------------------------------------
    // Internal Memory
    // Instruction memory: Read always
    // Data memory: Disable write if read is activated, bad address or address out
    //      of IMEM space.
    //--------------------------------------------------------------------------
    assign iimem_we = 0;
    assign dimem_we = dmem_write & ~dmem_read & ~exc_bad_mem_address & (ddata_selector == `IMEM_SPACE_SOURCE);

    //--------------------------------------------------------------------------
    // Handle internal memory
    // Read/Write to internal memory requires 2 clock cycles (registered address)
    // 3 state FSM.
    // 00 -> Reset. Instruction on IA
    // 01 -> Default State. First cycle of R/W operation.
    // 10 -> Ready State. R/W operation is finished.
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        iimem_delay <= (rst) ? 2'b00 : (if_flush | (if_stall & ~if_stall_md) | (idata_selector != `IMEM_SPACE_SOURCE))                   ? 2'b01 : (iimem_delay == 2'b10) ? 2'b01 : iimem_delay + 2'b01;    // 2 cycles operation
        dimem_delay <= (rst) ? 2'b00 : (~dmem_operation | exc_bad_mem_address | (ddata_selector != `IMEM_SPACE_SOURCE)) ? 2'b01 : (dimem_delay == 2'b10) ? 2'b01 : dimem_delay + 2'b01;    // Do nothing if flush (exception), or stall
    end

    always @(posedge clk) begin
        iimem_ready <= (rst) ? 1'b0 : ((iimem_delay == 2'b10) & ~iimem_we)                ? 1'b1 : 1'b0;
        dimem_ready <= (rst) ? 1'b0 : (dimem_we || ((dimem_delay == 2'b10) & ~dimem_we))  ? 1'b1 : 1'b0;
    end

    //--------------------------------------------------------------------------
    // External Memory/Cache
    // The ready signal is synchronous.
    //--------------------------------------------------------------------------
    assign eimem_cache_wr = dmem_write & ~dmem_read;
    assign eimem_cache_enable = ~eimem_cache_ready & dmem_operation & ~exc_bad_mem_address & (idata_selector == `EMEM_SPACE_SOURCE);

    assign edmem_cache_wr = dmem_write & ~dmem_read;
    assign edmem_cache_enable = ~edmem_cache_ready & dmem_operation & ~exc_bad_mem_address & (idata_selector == `EMEM_SPACE_SOURCE);

    //--------------------------------------------------------------------------
    // Static Instruction Address Translate.
    //--------------------------------------------------------------------------
    always @(*) begin
        if (~imem_address[31]) begin
            physical_iaddress <= {dmem_address[31:30] + 2'b01, dmem_address[29:0]};     // User space
            idata_selector    <= `EMEM_SPACE_SOURCE;
        end
        else if (imem_address[31:29] == 3'b101) begin
            physical_iaddress <= {2'b00, imem_address[29:0]};                           // K1: low address: Boot code, Internal memory
            idata_selector    <= `IMEM_SPACE_SOURCE;
        end
        else  if (imem_address[31:30] == 2'b11) begin
            physical_iaddress <=  imem_address;                                         // K2: direct mapping
            idata_selector    <= `EMEM_SPACE_SOURCE;
        end
        else begin
            physical_iaddress <=  32'h0000_0000;                                        // K2: direct mapping
            idata_selector    <= `INVALID_SPACE;
        end
    end

    //--------------------------------------------------------------------------
    // Static Data Address Translate.
    // Also, perform word align to address (data memory access is 32-bits wide)
    //--------------------------------------------------------------------------
    always @(*) begin
        if (~dmem_address[31]) begin
            physical_daddress <= {dmem_address[31:30] + 2'b01, dmem_address[29:2], 2'b00};      // User space: address + 0x4000_0000
            ddata_selector    <= `EMEM_SPACE_SOURCE;
        end
        else if (dmem_address[31:29] == 3'b100) begin
            physical_daddress <= {3'b000, dmem_address[28:2], 2'b00};                           // K0: low address: I/O space
            ddata_selector    <= `IO_SPACE_SOURCE;
        end
        else if (dmem_address[31:30] == 2'b10) begin
            physical_daddress <= {2'b00, dmem_address[29:2], 2'b00};                            // K1: low address: Boot code, Internal memory
            ddata_selector    <= `IMEM_SPACE_SOURCE;
        end
        else begin
            physical_daddress <=  {dmem_address[31:2], 2'b00};                                  // K2: direct mapping
            ddata_selector    <= `EMEM_SPACE_SOURCE;
        end
    end

    //--------------------------------------------------------------------------
    // Select source to instruction data port
    //--------------------------------------------------------------------------
    always @(*) begin
        case (idata_selector)
            `IMEM_SPACE_SOURCE : imem_data <= iimem_data_i;         // get data from Internal memory
            `EMEM_SPACE_SOURCE : imem_data <= eimem_cache_data_i;   // get data from External memory
            default            : imem_data <= 32'bx;
        endcase
    end

    //--------------------------------------------------------------------------
    // Select source to instruction data port
    //--------------------------------------------------------------------------
    always @(*) begin
        case (ddata_selector)
            `IO_SPACE_SOURCE   : data_memory <= io_data_i;            // get data from I/O port.
            `IMEM_SPACE_SOURCE : data_memory <= dimem_data_i;         // get data from Internal memory
            `EMEM_SPACE_SOURCE : data_memory <= edmem_cache_data_i;   // get data from External memory
            default            : data_memory <= 32'bx;
        endcase
    end

    //--------------------------------------------------------------------------
    // Write to data memory
    //
    // Format:
    // byte : {b, b, b, b}
    // half : {h, h}
    // word : {w}
    //--------------------------------------------------------------------------
    assign mem_hh = (data_byte)                 ? dmem_data_i[7:0] : ((data_halfword) ? dmem_data_i[15:8] : dmem_data_i[31:24]);
    assign mem_hl = (data_byte | data_halfword) ? dmem_data_i[7:0]                                        : dmem_data_i[23:16];
    assign mem_lh = (data_byte)                 ? dmem_data_i[7:0]                                        : dmem_data_i[15:8];
    assign mem_ll =                                                                                         dmem_data_i[7:0];

    //--------------------------------------------------------------------------
    // Read from data memory.
    // check this crap
    //--------------------------------------------------------------------------
    always @(*) begin
        if (data_byte) begin
            case (dmem_address[1:0])
                2'b00   : dmem_data_o <= (data_sign_extend) ? { {24{data_memory[7]} }, data_memory[7:0] }    : {24'b0, data_memory[7:0]};
                2'b01   : dmem_data_o <= (data_sign_extend) ? { {24{data_memory[15]} }, data_memory[15:8] }  : {24'b0, data_memory[15:8]};
                2'b10   : dmem_data_o <= (data_sign_extend) ? { {24{data_memory[23]} }, data_memory[23:16] } : {24'b0, data_memory[23:16]};
                2'b11   : dmem_data_o <= (data_sign_extend) ? { {24{data_memory[31]} }, data_memory[31:24] } : {24'b0, data_memory[31:24]};
                default : dmem_data_o <= (data_sign_extend) ? { {24{data_memory[7]} }, data_memory[7:0] }    : {24'b0, data_memory[7:0]};
            endcase
        end
        else if(data_halfword) begin
            case (dmem_address[1])
                1'b0    : dmem_data_o <= (data_sign_extend) ? { {16{data_memory[15]} }, data_memory[15:0] }   : {16'b0, data_memory[15:0]};
                1'b1    : dmem_data_o <= (data_sign_extend) ? { {16{data_memory[31]} }, data_memory[31:16] }  : {16'b0, data_memory[31:16]};
                default : dmem_data_o <= (data_sign_extend) ? { {16{data_memory[15]} }, data_memory[15:0] }   : {16'b0, data_memory[15:0]};
            endcase
        end
        else begin
            dmem_data_o <= data_memory;
        end
    end
endmodule
