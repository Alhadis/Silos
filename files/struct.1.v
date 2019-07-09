`include "constants.vh"



typedef struct packed
{
  reg [`XLEN-1:0] pc;
  reg [2:0] thread_id;
  reg [`INSTR_WIDTH-1:0] instr;
} instr_decode_struct_o;

typedef struct packed
{
  reg [`OP_SEL_WIDTH-1:0] op_sel;
   reg [`ALU_OP_WIDTH-1:0] alu_op;
  reg [`REG_ADDR_WIDTH-1:0] rs1;
  reg [`REG_ADDR_WIDTH-1:0] rs2;
  reg [`REG_ADDR_WIDTH-1:0] rd;
  reg [`XLEN-1:0] imm;
  reg [`XLEN-1:0] pc;
  reg [2:0] thread_id;
  reg [`FU_SEL_WIDTH-1:0] fu_sel;
} decode_issue_struct_o;

typedef struct packed
{  
  reg [5:0] issue_op ;
  
  reg [`XLEN-1:0] issue_v1;
  reg issue_v1_rdy ;
  reg [`ROB_SIZE-1:0] issue_q1;
  
  reg [`XLEN-1:0] issue_v2;
  reg issue_v2_rdy ;
  reg [`ROB_SIZE-1:0] issue_q2;
  
  reg [`ROB_SIZE-1:0] issue_tag;
} issue_rs_struct_o;

typedef struct packed
{ 
  reg rs_op;
  
  reg [`XLEN-1:0] rs_v1;
  reg [`XLEN-1:0] rs_v2;
  
  reg [`ROB_SIZE-1:0] rs_tag;
  reg rs_valid;
} rs_alu_struct_o;

typedef struct packed
{
  reg busy ;
  
  reg [5:0] op ;
  
  reg [`XLEN-1:0] v1;
  reg v1_rdy ;
  reg [`ROB_SIZE-1:0] q1;
  
  reg [`XLEN-1:0] v2;
  reg v2_rdy ;
  reg [`ROB_SIZE-1:0] q2;
  
  reg [`ROB_SIZE-1:0] tag;
} reservation_station_t;

typedef struct packed
{
  logic busy ;
  
  logic [5:0] op ;
  
  logic [`XLEN-1:0] v1;
  logic v1_rdy ;
  logic [`ROB_SIZE-1:0] q1;
  
  logic [`XLEN-1:0] v2;
  logic v2_rdy ;
  logic [`ROB_SIZE-1:0] q2;
  
  logic tag;
} reservation_station_unkilled_t;

typedef struct packed
{
  logic [`ROB_SIZE-1:0] tag;
  logic [`XLEN-1:0] value;
  logic valid;
  
} alu_cdb_struct_o;

typedef struct packed
{
  reg [`ROB_SIZE-1:0] tag;
  reg [`XLEN-1:0] value;
  reg valid;
} cdb_struct_t;

typedef struct packed
{
  reg [`XLEN-1:0] value;
  reg valid;
  reg [`REG_ADDR_WIDTH-1:0] dest;
} rob_struct_t;

typedef struct packed
{
  reg valid;
  reg [`REG_ADDR_WIDTH-1:0] dest;
} issue_rob_struct_o;

typedef struct packed
{
  reg valid;
  reg [`REG_ADDR_WIDTH-1:0] dest;
  reg [`XLEN-1:0] value;
} rob_regfile_struct_o;

typedef struct packed
{
  reg rs_name;
  reg rs_busy;
  reg rs_op;
  reg rs_value1;
  reg rs_value1_rdy;
  reg rs_queue1;
} rs_ld_struct_t;
