/* example and tutorial file */

// synopsys test line

// psl assert test line

// todo: Press TAB on each line below
module example (
  in_port,
            out_port
         );

// todo: Type "input 3 in_port;<RET>" and "output 5 out_put;<RET>" below:


reg       [1:0]   sig_test;                     // test signal

// todo: Line up lines below, use TAB:
parameter     [2:0] para1  = value1;
parameter            [2:0]para2 = value2;
parameter[2:0]   para3   = value3;

// todo: Select the code block below, use C-c C-TAB or M-x align <RET>.  Emacs
//       will compute appropriate align columns and align the code for you:
reg unsigned counter;
reg [1:0] result;
wire [width-1:0] comp;

// todo: Code alignment works with declarations as well as assignments.
//       Try it on the two code blocks blow:
assign comp_a = {a[width-1] ^ comp_op[3] , a[width-2:0]};
assign comp_b = {b[width-1] ^ comp_op[3] , b[width-2:0]};
assign a_eq_b = (comp_a == comp_b);
assign a_lt_b = (comp_a < comp_b);
assign {cy_sum, result_sum} = a + b;
assign {cy_csum, result_csum} = a + b + {32'd0, carry};
assign result_and = a & b;

begin
  a_very_long_signal_name <= {a[31:8], b[7:0]};
  cust <= {a[31:16], b[7:0], a[7:0]};
  short_sig <= {a[31:24], b[7:0], a[15:0]};
  another_signal <= {b[7:0], a[23:0]};
end

// todo: Insert an always block shown below, type with your fingers :)
//       Make sure you typed every letter, <M-s> means type Alt+s.
/*
always @(posedge clk)
if (reset_b)
begin
sig ,, 1b0;
end
else
<M-s> sig_d;
*/

// todo: OK, make another always block, but this time you just need to type
//       <C-c C-c C-a>, type it below:


// todo: Move cursor on `begin', and press <C-c TAB>.  You can see that the
//       whole block is indented:
always @(posedge clk)
     begin
  if (work)
    if (~x && y)
    uv = step;
        else
      uv = step>>1;
        else
          case (rog)
              2'b00   : vsstep_uv = 11'd128;
  2'b11   : vsstep_uv = 11'd128;
      2'b01   : vsstep_uv = 11'd256;
           2'b10   : vsstep_uv = 11'd64;
  default : vsstep_uv = 11'd128;
    endcase
  end
// todo: Try <C-c %> when the cursor is on `begin', `end' (any block beginning
//       or block end) or `else'.

// todo: Indent & align lines below, use TAB:
m_ff_ce #(1,1'b0) u_ff_1 (
 .clk            (clk),  // clock
  .rst_b           (rst_b),  // reset
 .i_ce      (1'b1),// enable
  .i_in1        (in_port), // input
 .o_out1   (out_port));// output


// todo: Put cursor on sig_test, then press F1, its width will be displayed in echo area.
//       Then move cursor on sig, then type <C-c C-d>, emacs will trace its driver, then
//       type <C-c C-n>, emacs will trace the next drive place.
always @(sig)
  if (sig)
     sig_test = sig;
  else
     sig_test = 2'b0;

// todo: Insert a combinative always block, use <C-c C-c a>.
//       Than type something, and then use <C-c C-a> to complete its sensitive list.
//       If you're not satisfied, try to set vlog-auto-sense-abandon-old-list and
//       vlog-auto-sense-refill-old-list.


// todo: Type <C-c C-h> to insert a file header, set vlog-skel-user-name as your name and
//       vlog-skel-company-name as your company name. set vlog-skel-header-string to make
//       your own header string. C-h v vlog-skel-header-string <RET>, or check the source
//       in vlog-skel.el.


// DOC: example.v ends here
