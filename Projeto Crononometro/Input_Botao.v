//define novo estado da máquina baseado no botão que foi pressionado
//Input: estado dos Botoes;
//Output: Novo estado da maquina de estados;
module Input_Botao(clk,botao0,botao1,botao2,botao3,estado);
  input clk,botao0,botao1,botao2,botao3;
  output reg [1:0] estado;
  parameter pressionado=0;
  parameter para=0, pause=1, reset=2, conta=3; 
  reg [3:0] estado_anterior_botao=4'b1111;
  always @(negedge clk) begin	
     if(~botao0)estado_anterior_botao[0] <= pressionado;
     if(~botao1)estado_anterior_botao[1] <= pressionado;
     if(~botao2)estado_anterior_botao[2] <= pressionado;
     if(~botao3)estado_anterior_botao[3] <= pressionado;	
     if(estado_anterior_botao[0]==pressionado && botao0) begin
      estado <= para;
      estado_anterior_botao[0] <= !pressionado;
    end
     if(estado_anterior_botao[1]==pressionado && botao1) begin
      estado <= pause;
      estado_anterior_botao[1] <= !pressionado;
    end
     if(estado_anterior_botao[3]==pressionado && botao3) begin
      estado <= conta;
      estado_anterior_botao[3] <= !pressionado;
    end
     if(estado_anterior_botao[2]==pressionado && botao2) begin
      estado <= reset;
      estado_anterior_botao[2] <= !pressionado;
    end
  end
endmodule