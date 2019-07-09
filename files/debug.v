include hashModule.v;
include constants.v;


reg [255:0] validNonce;
reg [255:0] validHash;
reg [31:0] count = 1;
wire [NUM_MODULES-1:0] done=0;
reg fullDone;

genvar moduleVar;
for(moduleVar=0; moduleVar<NUM_MODULES; moduleVar=moduleVar+1) begin: modules
  reg [31:0] nonce [7:0];
  wire [31:0] hash [7:0];

  initial begin
     fullDone<=0;
     nonce[0]<=moduleVar;
  end


  genvar zeroVar;
  for(zeroVar=1; zeroVar<8; zeroVar=zeroVar+1) begin: zeros
      initial begin
        nonce[zeroVar]<=32'h00000000;
      end
  end

  wire [255:0] flattenedNonce;
  wire [255:0] flattenedHash;

  genvar index1;
  for (index1=0; index1 < 8; index1=index1+1) begin: flatten
      assign flattenedNonce[255-32*index1:224-32*index1] = nonce[index1];
  end
  hashModule m(
    clock.val,
    flattenedNonce,
    flattenedHash
  );

  genvar index2;
  for (index2=0; index2 < 8; index2=index2+1) begin: unflatten
      assign hash[index2] = flattenedHash[255-32*index2:224-32*index2];
  end

  assign done[moduleVar]=flattenedHash[255:256-LEADING_ZEROS]==0;

  always @(posedge clock.val) begin
  //if we have a completed hash
    if (count%CYCLES_TO_HASH==0) begin
    /*
      $display("%h", flattenedNonce);
      $display("%h", flattenedHash);
      */
      if(done[moduleVar])begin
      /*
        $display("Found Done");
        $display("%b", done);
        $display("%d", (NUM_MODULES-moduleVar));
        $display("%b", done<<(NUM_MODULES-moduleVar));
        $display("%d", ~(|(done<<(NUM_MODULES-moduleVar)))   );
        */
        if(~(|(done<<(NUM_MODULES-moduleVar))) )begin
          validNonce<=flattenedNonce;
          validHash<=flattenedHash;
          /*
          $display("Should Finish");
          $display("%h", flattenedNonce);
          $display("%h", flattenedHash);
          */
          fullDone<=1;
        end
      end
      else begin
        nonce[0]<=nonce[0]+NUM_MODULES;
      end
    end
  end


  

end


always @(posedge clock.val) begin
  count <= (count + 1);
    if(fullDone) begin
      $display("%d", count);
      $display("%h", validNonce);
      $display("%h", validHash);
      $finish(1);
    end
end