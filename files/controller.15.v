module controller(Clk, Reset, IR, flag, ldMAR, ldIR, ldPC, ldSP, ldMDR, ldReg, ldRegBank, TReg, TRegBank, TSP, TMAR, TPC, TMDR, TLabel, MemRead, MemWrite, IRWrite, fnSel, state, nextstate);
  
  input [15:0]IR;
  input [4:0] state;
  input Clk, Reset, flag;

  output [2:0] fnSel;
  output [4:0] nextstate;
  output ldMAR, ldIR, ldPC, ldSP, ldMDR, ldReg, ldRegBank, TReg, TRegBank,     TSP, TMAR, TPC, TMDR, TLabel, MemRead, MemWrite, IRWrite;
  
  reg [2:0] fnSel;
  reg ldMAR, ldIR, ldPC, ldSP, ldMDR, ldReg, ldRegBank, TReg, TRegBank,       TSP, TMAR, TPC, TMDR, TLabel, MemRead, MemWrite, IRWrite;
  
  reg[4:0] nextstate;
  
  parameter S0=0;
  parameter S1=1;
  parameter S2=2;
  parameter S3=3;
  parameter S4=4;
  parameter S5=5;
  parameter S6=6;
  parameter S7=7;
  parameter S8=8;
  parameter S9=9;
  parameter S10=10;
  parameter S11=11;
  parameter S12=12;
  parameter S13=13;
  parameter S14=14;
  parameter S15=15;
  parameter S16=16;


  
  
  
  always@(state or IR)
    
    case(state)
      S0:begin               // MAR <- PC
        ldMAR = 1'b1;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg = 1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b1;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        nextstate = S1;
      end
      
      S1:begin        // IR <- <MAR> , PC <- PC + 1
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b1;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg = 1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b1;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b1;
        MemWrite = 1'b0;
        IRWrite = 1'b1;
        fnSel = 3'b010;

        if(IR[3:0] == 4'b1111)
        begin
          if(IR[5:4] == 2'b00)
          begin
          nextstate = S2;
          end
          else
          begin
          nextstate = S3;
          end
        end

        else if(IR[3:0] == 4'b1001)
        begin
        nextstate = S2;
        end

        else
        begin
          if(flag == 1'b0)
          begin
          nextstate = S0;
          end
          else
          begin
          nextstate = S14;
          end
        end


        
      end
      
      S2:begin        // sp <- sp - 1
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b1;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b1;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b011;
        nextstate = S3;
      end
      
      S3:begin        // MAR <- sp
        ldMAR = 1'b1;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b1;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        
        if(IR[3:0] == 4'b1111)
        begin
          if(IR[5:4] == 2'b00)
          begin
          nextstate = S6;
          end
          else
          begin
          nextstate = S4;
          end
        end

        else
        begin
        nextstate = S4;
        end


      end
            
            
      
     S4:begin         // MDR <- <MAR>
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b1;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b000;

       if(IR[3:0] == 4'b1001)
       begin
       nextstate = S9;
       end
        
       else
       begin
       nextstate = S5;
       end
      end
      


      S5:begin            //sp <- sp + 1
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b1;
        ldMDR = 1'b0;
        ldReg = 1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b1;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b010;
        
        if(IR[5:4] == 2'b10)
        begin
        nextstate = S8;
        end  

        else if(IR[5:4] == 2'b10)
        begin
        nextstate = S9;
        end

        else 
        begin
          if(IR[7:6] == 2'b00)
          begin
          nextstate = S10;
          end

          else if(IR[7:6] == 2'b10)
          begin
          nextstate = S16;
          end

          else if(IR[7:6] == 2'b01)
          begin
          nextstate = S10;
          end

          else
          begin
          nextstate = S12;
          end
        end
    end
    


      S6:begin            // MDR <- RB
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b1;
        ldReg = 1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b1;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        
        nextstate = S7;

      end
      


      S7:begin            // <MAR> <- MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg = 1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b1;
        IRWrite = 1'b0;
        fnSel = 3'b000;
        nextstate = S0;
      end
      


      S8:begin            // RB <- MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg = 1'b0;
        ldRegBank = 1'b1;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b1;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        nextstate = S0;
      end
      


      S9:begin        // PC <- MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b1;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b1;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        
        if(IR[3:0] == 4'b1001)
        begin
        nextstate = S14;
        end

        else
        begin
        nextstate = S0;
        end

      end
        
            
      
      S10:begin         // R <- MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b1;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b1;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;

        if(IR[7:6] == 2'b00)
        begin
        nextstate = S11;
        end

        else
        begin
        nextstate = S13;
        end
      end

      S11:begin         // RB <- R + RB
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b1;
        TLabel = 1'b0;
        TReg = 1'b1;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b1;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b100;
        nextstate = S0;
      end

      S12:begin         // RB <- ~MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b1;
        TLabel = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b1;
        TRegBank = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b101;
        nextstate = S0;
      end

      S13:begin         // RB <- RB|R
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b1;
        TLabel = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b1;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b111;
        nextstate = S0;
      end

      S14:begin         // R <-  Label
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b1;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b1;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b001;
        nextstate = S15;
      end

      S15:begin         // PC <- PC + R
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b1;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b0;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b1;
        TMDR = 1'b0;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b100;
        nextstate = S0;
      end


      S16:begin         // RB <- neg MDR
        ldMAR = 1'b0;
        ldIR = 1'b0;
        ldPC = 1'b0;
        ldSP = 1'b0;
        ldMDR = 1'b0;
        ldReg =1'b0;
        ldRegBank = 1'b1;
        TReg = 1'b0;
        TSP = 1'b0;
        TMAR = 1'b0;
        TPC =  1'b0;
        TMDR = 1'b1;
        TRegBank = 1'b0;
        TLabel = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IRWrite = 1'b0;
        fnSel = 3'b110;
        nextstate = S0;
      end
      endcase
  
    
 endmodule 


