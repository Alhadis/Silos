module Test_Bench ;

reg clk , reset ;

Top_Module top_module (clk , reset);


always
begin
#100
clk = ~ clk ;
end

initial
begin

$readmemb("inst_mem.txt",top_module.IMemory.iMemory);

top_module.reg_file.RF[0] <= 0; //$zero
top_module.reg_file.RF[1] <= 5; 
top_module.reg_file.RF[2] <= 1; 
top_module.reg_file.RF[3] <= 2; 
top_module.reg_file.RF[4] <= 3; 
top_module.reg_file.RF[5] <= 4; 
top_module.reg_file.RF[6] <= 5; 
top_module.reg_file.RF[7] <= 6; 
top_module.reg_file.RF[8] <= 7;   //$t0
top_module.reg_file.RF[9] <= 5;  //$t1
top_module.reg_file.RF[10] <= 4;  //$t2
top_module.reg_file.RF[11] <= 2;  //$t3
top_module.reg_file.RF[12] <= 3;  //$t4
top_module.reg_file.RF[13] <= 2;  //$t5
top_module.reg_file.RF[14] <= 5;  //$t6
top_module.reg_file.RF[15] <= 8; //$t7
top_module.reg_file.RF[16] <= 1; //$s0
top_module.reg_file.RF[17] <= 2; //$s1
top_module.reg_file.RF[18] <= 3; //$s2
top_module.reg_file.RF[19] <= 3; //$s3
top_module.reg_file.RF[20] <= 1; //$s4
top_module.reg_file.RF[21] <= 2; //$s5
top_module.reg_file.RF[22] <= 2; //$s6
top_module.reg_file.RF[23] <= 0; //$s7
top_module.reg_file.RF[24] <= 2;//$t8
top_module.reg_file.RF[25] <= 3;//$t9


top_module.DMemory.dMemory [0] = 0 ;
top_module.DMemory.dMemory [1] = 1 ;
top_module.DMemory.dMemory [2] = 2 ;
top_module.DMemory.dMemory [3] = 3 ;
top_module.DMemory.dMemory [4] = 4 ;
top_module.DMemory.dMemory [5] = 5 ;
top_module.DMemory.dMemory [6] = 6 ;
top_module.DMemory.dMemory [7] = 50 ;
top_module.DMemory.dMemory [8] = 0 ;
top_module.DMemory.dMemory [9] = 1 ;
top_module.DMemory.dMemory [10] = 2 ;
top_module.DMemory.dMemory [11] = 3 ;
top_module.DMemory.dMemory [12] = 4 ;
top_module.DMemory.dMemory [13] = 5 ;
top_module.DMemory.dMemory [14] = 6 ;
top_module.DMemory.dMemory [15] = 7 ;
top_module.DMemory.dMemory [16] = 8 ;
top_module.DMemory.dMemory [17] = 9 ;
top_module.DMemory.dMemory [18] = 10 ;
top_module.DMemory.dMemory [19] = 11 ;
top_module.DMemory.dMemory [20] = 12 ;
top_module.DMemory.dMemory [21] = 13 ;
top_module.DMemory.dMemory [22] = 14 ;
top_module.DMemory.dMemory [23] = 15 ;
top_module.DMemory.dMemory [24] = 16 ;
top_module.DMemory.dMemory [25] = 17 ;




#50
clk = 0;
reset = 1;
#150 reset = 0;
end
endmodule
