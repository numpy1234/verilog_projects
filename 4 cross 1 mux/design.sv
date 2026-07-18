// Code your design here
module  four_cross_1mux(input [1:0] s, input [3:0] d, output y);
  assign y= ~s[0]&~s[1]&d[0] | s[0]&~s[1]&d[1] | ~s[0] &s[1]&d[2] | s[0]& s[1]&d[3];
endmodule
