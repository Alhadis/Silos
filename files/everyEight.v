module everyEight;

reg       A;

initial begin: stop_at
   // Will stop the execution after 20 simulation units.
   #20; $finish;   
end

// These statements done at simulation time 0 (since no #k)
initial begin: Init
    // Initialize register A.
    A = 1;    
    $dumpfile("everyEight.vcd");
    $dumpvars(0, everyEight);
 
    // Display a header
    $display("Time   A");  
            
    // Prints the values anytime a value of A changes
    $monitor("  %0d %b", $time, A);
end

//main_process will loop until simulation is over
always begin: main_process
    integer i; // Initiate a counter
    
    while(1)
    begin
        A = 1;
        #1; A = 0; // Change A's value to '0' at end of cycle 1 

        for (i = 0; i < 7; i = i + 1)
        begin
	    #1;
        end
    end
    
end

endmodule
