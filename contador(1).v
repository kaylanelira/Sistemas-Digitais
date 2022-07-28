module contador(cont, n0, n1, n2, n3, ativa_display);
  input [13:0] cont;
  input ativa_display;
  output reg [3:0] n0, n1, n2, n3;
  always @ (cont) begin
    if(~ativa_display)begin
      n0 <= cont%10;
      n1 <= (cont%100 - n0)/10;
      n2 <= ((cont-(n1*10 + n0))/100)%10;
      n3 <= ((cont-(n2*100 + n1*10 + n0))/1000)%10;
    end
  end
endmodule