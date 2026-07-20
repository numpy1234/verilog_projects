// Code your testbench here
// or browse Examples
module testbench();
  reg [3:0] in;
  wire [15:0]out;
  
  
  four_cross_sixteen_decoder decoder(.w(in[3]), .x(in[2]), .y(in[1]), .z(in[0]), .out(out));
  
  
  reg clk;
  reg rst;
  
  initial begin
    clk=0;
    rst=1;
    #20
    rst=0;
  end
  
  always begin
    #10
    clk=~clk;
  end
  
  
  reg[3:0] i;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      i<=0;
      in<=0;
    end
    else begin
      in<=i;
      if(i==15)
        #10
        $finish;
      else
        i<=i+1;
    
    end
  end
  
  initial begin
    $monitor("t=%0t in=%b out=%b", $time, in, out);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule

    