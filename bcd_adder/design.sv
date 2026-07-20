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

  
  

module four_bit_adder(input [3:0]a,b, input cin, output [3:0]finalsum, output cout);
  wire [1:0] p;
  full_adder one(.x(a[0]), .y(b[0]), .cin(cin), .sum(p));
  assign finalsum[0]=p[0];
  
  
  wire [1:0] q;
  full_adder two(.x(a[1]), .y(b[1]), .cin(p[1]), .sum(q));
  assign finalsum[1]=q[0];
  
  wire [1:0] r;
  full_adder three(.x(a[2]), .y(b[2]), .cin(q[1]), .sum(r));
  assign finalsum[2]=r[0];
  
  wire [1:0] s;
  full_adder four(.x(a[3]), .y(b[3]), .cin(r[1]), .sum(s));
  assign finalsum[3]=s[0];
  
  assign cout=s[1];
  
endmodule



module bcd_adder(input [3:0]a, input [3:0]b, input cin, output [3:0]bcdsum, output final_cout);
  wire[3:0] sum1;
  wire k;
  
  four_bit_adder one(.a(a), .b(b), .cin(cin), .finalsum(sum1),.cout(k));
  
  
  
  wire output_carry;
  assign output_carry=k | sum1[3]&sum1[2] | sum1[3] & sum1[1];
  
  
  wire[3:0] sum2;
  wire correction_carry;
 
  
  four_bit_adder two(.a(4'b0110), .b(sum1), .cin(1'b0), .finalsum(sum2),.cout(correction_carry));
  
  assign bcdsum= output_carry ? sum2 : sum1;
  assign final_cout = output_carry;
  
 
endmodule
  
  
  
  
  
  
  
  
  
  
  