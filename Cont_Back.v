// Write your modules here!
module Cont_Back(clk,estado,cont,ativa_display);
  output reg [13:0] cont=0;
  output reg ativa_display;
  input clk;
  input [1:0]estado;
  reg parado=0;
  reg [30:0] i=0;
  parameter para=0, pause=1, reset=2, conta=3;
  parameter periodo=50000;
  always @(posedge clk) begin
    case(estado)	
      para: begin
           ativa_display<=0; 
           parado<=1;
      	  end
      pause: begin 
         ativa_display <= 1;
         if(i >= periodo && !parado) begin 
            cont <= cont+1;
            i <= 0;
            if(cont == 10000) cont<=0;
         end
         else i <= i+1;
        end
      reset: begin 
           cont <= 0;
           ativa_display <= 0;
           parado <= 1;
         end
      conta: begin 
          ativa_display <= 0;
          parado <= 0;
          if(i >= periodo) begin 
            cont <= cont+1;
            if(cont == 10000) cont <= 0;
            i <= 0;
          end
          else i <= i+1;
        end
       default:
         begin 
           cont <= 0;
           ativa_display <= 0;
           parado <= 1;
         end
    endcase
  end
  
endmodule