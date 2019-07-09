module Cache(CacheWrite, Address, Write_Data, clk, rst, Miss, Out_Data);
  input CacheWrite, clk, rst;
  input [14:0] Address;
  input [127:0] Write_Data;

  output[31:0] Out_Data;
  output reg Miss;

  reg [127:0] Data[0:1023]; // 1k of 128 bits == 4k of 32 bits
  reg [2:0] Tags [0:1023];
  reg [0:1023] Valids ;
  
  reg [31:0] MissCount;
  integer i;

  always@(posedge clk, posedge rst) begin
    if(rst) begin
      for(i = 0; i < 1024; i = i+1) begin
        Data[i] <= 128'b0;
        Tags[i] <= 3'b0;
        Valids[i] <= 0;
        MissCount <= 0;
        //Miss <= 16'b0;
      end
    end

    else if(CacheWrite) begin // overwrite
      Data[Address[11:2]] <= Write_Data;
      Tags[Address[11:2]] <= Address[14:12];
      Valids[Address[11:2]] <= 1;
    end

  end

  always @(Address, rst) begin
    Miss = ((Tags[Address[11:2]] != Address[14:12]) | Valids[Address[11:2]] != 1) ? 1 : 0;
    if(Miss) begin 
      MissCount = MissCount + 1;
    end
  end

  MUX4 #(32) MUX_CACHE(Data[Address[11:2]][127:96], 
                       Data[Address[11:2]][95:64],
                       Data[Address[11:2]][63:32], 
                       Data[Address[11:2]][31:0], 
                       Address[1:0], Out_Data);
endmodule


