module SerialExit(input wrtcmp, input serclk, input [11:0]pixdata, output serialout);
	always@(posedge wrtcmp or serialclk)
		begin
		if(serialclk)