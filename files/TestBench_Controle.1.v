`include "../rtl/Controle.v"

module testBench();
  reg [31:0] result;
  reg [5:0] op;
  reg [5:0] fn;
  reg [4:0] rt;

  wire [2:0] selwsource;
  wire [1:0] selregdest;
  wire writereg;
  wire writeov;
  wire selimregb;
  wire selsarega;
  wire selalushift;
  wire [2:0] aluop;
  wire unsig;
  wire [1:0] shiftop;
  wire mshw;
  wire lshw;
  wire [2:0] msm;
  wire [2:0] msl;
  wire readmem;
  wire writemem;
  wire [1:0] selbrjumpz;
  wire [1:0] seltipopc;
  wire [2:0] compop;
  
  Controle c(
    op,
    fn,
    rt,
    selwsource,
    selregdest,
    writereg,
    writeov,
    selimregb,
    selsarega,
    selalushift,
    aluop,
    unsig,
    shiftop,
    mshw,
    lshw,
    msm,
    msl,
    readmem,
    writemem,
    selbrjumpz,
    seltipopc,
    compop  
  );
  
  initial begin
    result = 0;
    
    $dumpfile("dump.txt");
    $dumpvars;
    
    // SLL
    op = 6'b000000;
    fn = 6'b000000;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b1 && 
      selbrjumpz == 2'b01 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b10 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SRL
    op = 6'b000000;
    fn = 6'b000010;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b1 && 
      selbrjumpz == 2'b01 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b00 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SRA
    op = 6'b000000;
    fn = 6'b000011;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b1 && 
      selbrjumpz == 2'b01 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b01 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SLLV
    op = 6'b000000;
    fn = 6'b000100;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b10 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SRLV
    op = 6'b000000;
    fn = 6'b000110;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b00 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SRAV
    op = 6'b000000;
    fn = 6'b000111;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      shiftop == 2'b01 && 
      selalushift == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // JR
    op = 6'b000000;
    fn = 6'b001000;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      seltipopc == 2'b01 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // JALR
    op = 6'b000000;
    fn = 6'b001001;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b011 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      seltipopc == 2'b01 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ADD
    op = 6'b000000;
    fn = 6'b100000;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ADDU
    op = 6'b000000;
    fn = 6'b100001;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b1 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SUB
    op = 6'b000000;
    fn = 6'b100010;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SUBU
    op = 6'b000000;
    fn = 6'b100011;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b1 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // AND
    op = 6'b000000;
    fn = 6'b100100;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b000 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // OR
    op = 6'b000000;
    fn = 6'b100101;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b001 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // xOR
    op = 6'b000000;
    fn = 6'b100110;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b101 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // NOR
    op = 6'b000000;
    fn = 6'b100111;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b100 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SLT
    op = 6'b000000;
    fn = 6'b101010;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b100 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SLTU
    op = 6'b000000;
    fn = 6'b101011;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b0 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b01 && 
      selwsource == 3'b100 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b1 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BLTZ
    op = 6'b000001;
    fn = 6'bxxxxxx;
    rt = 5'b00000;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b100 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BGEZ
    op = 6'b000001;
    fn = 6'bxxxxxx;
    rt = 5'b00001;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b001 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BLTZAL
    op = 6'b000001;
    fn = 6'bxxxxxx;
    rt = 5'b10000;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      selregdest == 2'b10 && 
      selwsource == 3'b011 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      compop == 3'b100 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BGEZAL
    op = 6'b000001;
    fn = 6'bxxxxxx;
    rt = 5'b10001;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      selregdest == 2'b10 && 
      selwsource == 3'b011 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      compop == 3'b001 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // J
    op = 6'b000010;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      seltipopc == 2'b10 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // JAL
    op = 6'b000011;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selregdest == 2'b10 && 
      selwsource == 3'b011 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      seltipopc == 2'b10 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BEQ
    op = 6'b000100;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b000 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BNE
    op = 6'b000101;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b101 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BLEZ
    op = 6'b000110;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b010 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // BGTZ
    op = 6'b000111;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selsarega == 1'b0 && 
      selbrjumpz == 2'b10 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      compop == 3'b011 && 
      seltipopc == 2'b00 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ADDI
    op = 6'b001000;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ADDIU
    op = 6'b001001;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b1 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SLTI
    op = 6'b001010;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b100 && 
      writereg == 1'b1 && 
      writeov == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // SLTIU
    op = 6'b001011;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b100 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b1 && 
      aluop == 3'b110 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ANDI
    op = 6'b001100;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b000 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // ORI
    op = 6'b001101;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b001 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // xORI
    op = 6'b001110;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b000 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      aluop == 3'b101 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // LUI
    op = 6'b001111;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selregdest == 2'b00 && 
      selwsource == 3'b010 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      readmem == 1'b0 && 
      writemem == 1'b0
    )
      result = result + 1;

    // LB
    op = 6'b100000;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b011 && 
      msl == 3'b011
    )
      result = result + 1;

    // LH
    op = 6'b100001;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b011 && 
      msl == 3'b001
    )
      result = result + 1;

    // LWL
    op = 6'b100010;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b0 && 
      msm == 3'b010 && 
      msl == 3'b000
    )
      result = result + 1;

    // LW
    op = 6'b100011;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b001 && 
      msl == 3'b010
    )
      result = result + 1;

    // LBU
    op = 6'b100100;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b000 && 
      msl == 3'b100
    )
      result = result + 1;

    // LHU
    op = 6'b100101;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b000 && 
      msl == 3'b001
    )
      result = result + 1;

    // LWR
    op = 6'b100110;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b0 && 
      lshw == 1'b1 && 
      msm == 3'b000 && 
      msl == 3'b001
    )
      result = result + 1;

    // SB
    op = 6'b101000;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b100 && 
      msl == 3'b011
    )
      result = result + 1;

    // SH
    op = 6'b101001;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b010 && 
      msl == 3'b000
    )
      result = result + 1;

    // SWL
    op = 6'b101010;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b0 && 
      lshw == 1'b1 && 
      msm == 3'b000 && 
      msl == 3'b001
    )
      result = result + 1;

    // SW
    op = 6'b101011;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b001 && 
      msl == 3'b010
    )
      result = result + 1;

    // SWR
    op = 6'b101110;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      writereg == 1'b0 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b1 && 
      lshw == 1'b0 && 
      msm == 3'b010 && 
      msl == 3'b000
    )
      result = result + 1;

    // LL
    op = 6'b110000;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      writeov == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b1 && 
      writemem == 1'b0 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b001 && 
      msl == 3'b010
    )
      result = result + 1;

    // SC
    op = 6'b111000;
    fn = 6'bxxxxxx;
    rt = 5'bxxxxx;
    #1;
    if(
      selimregb == 1'b1 && 
      selsarega == 1'b0 && 
      selbrjumpz == 2'b00 && 
      selregdest == 2'b00 && 
      selwsource == 3'b001 && 
      writereg == 1'b1 && 
      unsig == 1'b0 && 
      aluop == 3'b010 && 
      selalushift == 1'b0 && 
      readmem == 1'b0 && 
      writemem == 1'b1 && 
      mshw == 1'b1 && 
      lshw == 1'b1 && 
      msm == 3'b001 && 
      msl == 3'b010
    )
      result = result + 1;

    $display("%d", result);
    $finish;
  end

endmodule
