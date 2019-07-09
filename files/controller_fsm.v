`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:13 08/11/2017 
// Design Name: 
// Module Name:    controller_fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module controller_fsm(ldn,Tn,ldcnt,Tcnt,ldf0,Tf0,ldf1,Tf1,ldout,Tout,fn_sel,B0,go,over,clk,state);
	input go,B0,clk;
	wire go,B0;
	output ldn,Tn,ldcnt,Tcnt,ldf0,Tf0,ldf1,Tf1,ldout,Tout,fn_sel,over,state;
	reg ldn,Tn,ldcnt,Tcnt,ldf0,Tf0,ldf1,Tf1,ldout,Tout,over;
	reg[2:0] fn_sel;
	reg[3:0] state;
	reg check_B0;
	parameter q0 = 4'b0000, q1 = 4'b0001, q2 = 4'b0010, q3 = 4'b0011, q4 = 4'b0100, q5 = 4'b0101, q6 = 4'b0110, q7 = 4'b0111, q8 = 4'b1000, q9 = 4'b1001, q10 = 4'b1010;
	always @(negedge clk)
	begin
	case(state)
	q0: begin
	    ldn = 1;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 0;
	    fn_sel = 3'b010;
	    over = 0;
	    if(go == 0)
	        state = q0;
	    else if(go == 1)
	        state = q1;
	    end
    q1: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 1;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 0;
	    fn_sel = 3'b001;
	    over = 0;
	    state = q2;
	    end
    q2: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 1;
	    Tf1 = 0;
	    ldout = 1;
	    Tout = 0;
	    fn_sel = 3'b001;
	    over = 0;
	    state = q3;
	    end
    q3: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 1;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 1;
	    ldout = 0;
	    Tout = 0;
	    fn_sel = 3'b100;
	    over = 0;
	    state = q4;
	    end
    q4: begin
	    ldn = 0;
	    Tn = 1;
	    ldcnt = 0;
	    Tcnt = 1;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 0;
	    over = 0;
		 check_B0 = B0;
		 state = q10;
//	    if(B0 == 0)
//	        state = q5;
//	    else if (B0 == 1)
//	        state = q9;
	    end
	 q10:begin
		 ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 0;
	    over = 0;
		 check_B0 = B0;
		 state = q10;
	    if(check_B0 == 0)
	        state = q5;
	    else if (check_B0 == 1)
	        state = q9;
		 end

    q5: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 1;
	    ldf1 = 0;
	    Tf1 = 1;
	    ldout = 1;
	    Tout = 0;
	    fn_sel = 3'b000;
	    over = 0;
	    state = q6;
	    end
    q6: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 1;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 1;
	    ldout = 0;
	    Tout = 0;
	    fn_sel = 3'b010;
	    over = 0;
	    state = q7;
	    end
    q7: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 1;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 1;
	    fn_sel =3'b011;
	    over = 0;
	    state = q8;
	    end
    q8: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 1;
	    Tcnt = 1;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 0;
	    fn_sel = 3'b100;
	    over = 0;
	    state = q4;
	    end
    q9: begin
	    ldn = 0;
	    Tn = 0;
	    ldcnt = 0;
	    Tcnt = 0;
	    ldf0 = 0;
	    Tf0 = 0;
	    ldf1 = 0;
	    Tf1 = 0;
	    ldout = 0;
	    Tout = 1;
	    fn_sel = 3'b011;
	    over = 1;
	    if(go == 1)
	        state = q9;
	    else if (go == 0)
	        state = q0;
	    end
    default: begin
            state = q0;
            end
    endcase
    end
//	 
//	 always @(state)
//		case(state)
//		q0: begin
//	    Tsw = 1;
//	    ldn = 1;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 3'b010;
//	    over = 0;
//		 end
//		q1: begin
//       Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 1;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 3'b001;
//	    over = 0;
//	    end
//		q2: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 1;
//	    Tf1 = 0;
//	    ldout = 1;
//	    Tout = 0;
//	    fn_sel = 3'b001;
//	    over = 0;
//	    end
//    q3: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 1;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 1;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 100;
//	    over = 0;
//	    end
//    q4: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 1;
//	    ldcnt = 0;
//	    Tcnt = 1;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 0;
//	    over = 0;
//	    end
//    q5: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 1;
//	    ldf1 = 0;
//	    Tf1 = 1;
//	    ldout = 1;
//	    Tout = 0;
//	    fn_sel = 3'b000;
//	    over = 0;
//	    end
//    q6: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 1;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 1;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 3'b011;
//	    over = 0;
//	    end
//    q7: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 1;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 1;
//	    fn_sel = 3'b011;
//	    over = 0;
//	    end
//    q8: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 1;
//	    Tcnt = 1;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 3'b100;
//	    over = 0;
//	    end
//    q9: begin
//        Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 1;
//	    fn_sel = 3'b000;
//	    over = 1;
//		end
//	default :begin Tsw = 0;
//	    ldn = 0;
//	    Tn = 0;
//	    ldcnt = 0;
//	    Tcnt = 0;
//	    ldf0 = 0;
//	    Tf0 = 0;
//	    ldf1 = 0;
//	    Tf1 = 0;
//	    ldout = 0;
//	    Tout = 0;
//	    fn_sel = 000;
//	    over = 0;
//		 end
//	endcase
    endmodule