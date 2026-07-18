// Code your design here
module  four_cross_1mux(input [1:0] s, input [3:0] d, output y);
  assign y= ~s[0]&~s[1]&d[0] | s[0]&~s[1]&d[1] | ~s[0] &s[1]&d[2] | s[0]& s[1]&d[3];
endmodule



module function_using_mux(
    input A, B, C, D,
    output F
);

wire [3:0] in;

assign in[0] = ~A;
assign in[1] = A | B;
assign in[2] = 1'b0;
assign in[3] = 1'b1;

four_cross_1mux mux(
    .s({C,D}),
    .d(in),
    .y(F)
);

endmodule