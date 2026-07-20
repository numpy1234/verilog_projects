// Code your design here
module carry_look_ahead_adder(input [3:0] a,b, input cin, output [3:0] sum, output carry);
  wire [3:0] P, G;
  
  wire c1, c2, c3, c4;
  
 
  assign P=a^b;
  assign G=a&b;
  assign c1 = G[0] | (P[0] & cin);

  assign c2 = G[1]
    | (P[1] & G[0])
    | (P[1] & P[0] & cin);

  assign c3 = G[2]
    | (P[2] & G[1])
    | (P[2] & P[1] & G[0])
    | (P[2] & P[1] & P[0] & cin);

  assign c4 = G[3]
    | (P[3] & G[2])
    | (P[3] & P[2] & G[1])
    | (P[3] & P[2] & P[1] & G[0])
    | (P[3] & P[2] & P[1] & P[0] & cin);
  
  assign sum[0]=P[0]^cin;
  assign sum[1]=P[1]^c1;
  assign sum[2]=P[2]^c2;
  assign sum[3]=P[3]^c3;
  
  assign carry = c4;
  
endmodule

  