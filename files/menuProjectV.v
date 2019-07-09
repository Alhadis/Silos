module menuProjectV(
	input  clock,
	input	 reset,
	input  [2:0]buttons,
	output [7:0]leds_line,
	output [4:0]leds_column,	
	output [11:0]lcd
);
	
project1 u0(
  .clk_clk            (clock),          //         clk.clk
  .buttons_export     (buttons),        //     buttons.export
  .leds_column_export (leds_column),    // leds_column.export
  .reset_reset_n      (reset),          //       reset.reset_n
  .leds_line_export   (leds_line),     //   leds_line.export
  .lcd_bl             (lcd[11]),        // .bl 
  .lcd_en             (lcd[10]),             //            .en
  .lcd_rs             (lcd[9]),              //            .rs
  .lcd_rw             (lcd[8]),             //            .rw
  .lcd_db             (lcd[7:0])            //         lcd.db
  );
endmodule	