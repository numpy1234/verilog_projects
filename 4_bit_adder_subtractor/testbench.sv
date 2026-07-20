// Code your testbench here
// or browse Examples
module testbench();
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  
  wire [3:0] sum;
  wire cout, v;
  
  
  four_bit_adder dut(.a(a), .b(b), .cin(cin), .finalsum(sum), .cout(cout), .v(v) );
  
  reg clk;
  reg rst;
  
  initial begin
    rst=1;
    clk=0;
    #20
    rst=0;
  end
  
  always begin
    #10
    clk=~clk;
  end
  
  integer i;
  initial begin
    i=0;
  end
  
  
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      i<=0;
      {a,b,cin}<=0;
      
    end
    else begin
      {a,b,cin}<=i;
      if(i==511) begin
        #10;
        $finish;
      end
      else begin
        i<=i+1;
      end
        
    end
  end
  
  
  initial begin
    $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b v=%b",
          $time, a, b, cin, sum, cout, v);
  end


  initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, testbench);
  end
  
  
  
endmodule
  
  