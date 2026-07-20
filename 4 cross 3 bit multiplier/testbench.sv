// Code your testbench here
// or browse Examples
module testbench();
  reg [3:0] b;
  reg [2:0] a;
 
  
  wire [5:0] value;
  wire cout;
  
  
  four_cross_three_bit_multiplier dut(.b(b), .a(a), .c(value), .carry(cout));
  
  integer i, j;

  initial begin
     

    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j <8 ; j = j + 1) begin
        b = i;
        a = j;
        #10;
        if ({cout, value} != a * b)
    	$display("Mismatch: a=%0d b=%0d Expected=%0d Got=%0d",
             a, b, a*b, {cout, value});
      	end
    
    end
    $finish;
  end
  
    
    

  initial begin
    $monitor("time=%0t b=%b a=%b cout=%b value=%b",
              $time, b,a, cout, value);
  end


  initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, testbench);
  end
  
  
  
endmodule
  
  