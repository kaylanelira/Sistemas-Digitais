module cronometro (clk, d0, d1, d2, d3, botao0, botao1, botao2, botao3);
  input botao0, botao1, botao2, botao3;
  reg [13:0] cont=0;
  input clk;
  wire [3:0] n0, n1, n2, n3;
  output [0:6] d0, d1, d2, d3;
  wire[1:0]estado;
  wire ativa_display;
  Input_Botao Botao(clk,botao0,botao1,botao2,botao3,estado);
  Cont_Back ContBack(clk,estado,cont,ativa_display);
  contador C(cont,n0,n1,n2,n3,ativa_display);
  decodificador num0(n0,d0);
  decodificador num1(n1,d1);
  decodificador num2(n2,d2);
  decodificador num3(n3,d3);
endmodule