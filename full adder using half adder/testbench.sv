// Code your testbench here
// or browse Examples
module testbench();
  
  reg [2:0] a;
  wire [1:0] s;
  full_adder dut(.x(a[2]), .y(a[1]), .cin(a[0]), .sum(s));
  
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
  
  
  reg[2:0] i;
  
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      i<=0;
      a<=0;
    end
    else begin
      a<=i;
      if(i==7) begin
        #10
        $finish;
      end
      else begin
        i<=i+1;
      end
      
    end
    
  end
  
  initial begin
    $monitor("t=%0t a=%b s=%b", $time, a, s);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
  
endmodule

  
  