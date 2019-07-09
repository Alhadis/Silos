module evenodd;

reg[0:7] A;
reg      C;

// Initialize the value of A and C. 
initial begin: init
    A = 0;
    C = 0;
end

// The main logic
always begin: main
    integer i; // Initiate the counter

    // Loop through each bit of A. Whenver the bit is '1', flip C
    for (i = 0; i < 8; i = i + 1)
    begin
        if (A[i] == 1)
        begin
            C = ~C;
        end
    end
    
    // Output display based on the value of C
    if (C) 
    begin
        $display ("%4d, %b has ODD  parity (%b)", $time, A, C);
    end
    else 
	begin
        $display ("%4d, %b has EVEN parity (%b)", $time, A, C);
    end
    
    #1;    
end

// Testbench
always begin: testCases
    A = 8'b01110001;
    C = 0;
    #1; A = 8'b01010001; 
    C = 0;
    #1; A = 8'b11111111;
    C = 0;
    #1; A = 8'b01111111;
    C = 0;
    #1; $finish;
end

endmodule
