// Code your design here
module half_adder(input x, y, output [1:0]s);
  assign s[0] = x ^ y;
  assign s[1] = x&y;
endmodule



module full_adder(input x, y, cin, output [1:0]sum);
  wire [1:0]p;
  half_adder one(.x(x), .y(y), .s(p));
  
  wire [1:0] q;
  
  half_adder two(.x(p[0]), .y(cin), .s(q));
  
  assign sum[0]=q[0];
  assign sum[1] = p[1]|q[1];
endmodule

  
  
  
  
  