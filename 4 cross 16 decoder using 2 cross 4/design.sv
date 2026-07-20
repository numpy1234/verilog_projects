// Code your design here
module two_cross_four_decoder(input a,b, output [3:0]d);
  assign d[0] = ~a & ~b;
  assign d[1]= ~a & b;
  assign d[2] = a & ~b;
  assign d[3] = a &b;
endmodule



module four_cross_sixteen_decoder(input w,x,y,z, output [15:0]out);
  wire [3:0]p,q;
  
  two_cross_four_decoder decoder(.a(w), .b(x), .d(p));
  two_cross_four_decoder decoder2(.a(y), .b(z), .d(q));
  genvar i, j;
  
  generate
    for(i=0; i<4; i=i+1) begin : row
      for(j=0; j<4; j=j+1) begin : col
        assign out[4*i+j]=p[i]&q[j];
      end
    end
  endgenerate
  
endmodule

  
      