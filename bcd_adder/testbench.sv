// Code your testbench here
// or browse Examples
module testbench();
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  
  wire [3:0] sum;
  wire cout;
  
  
  bcd_adder dut(.a(a), .b(b), .cin(cin), .bcdsum(sum), .final_cout(cout));
  
  integer i, j, k;

  initial begin
      for (k = 0; k < 2; k = k + 1) begin
          cin = k;

          for (i = 0; i < 10; i = i + 1) begin
              for (j = 0; j < 10; j = j + 1) begin
                  a = i;
                  b = j;
                  #10;
              end
          end
      end

      $finish;
  end

  initial begin
    $monitor("time=%0t a=%b b=%b cin=%b cout=%b sum=%b",
              $time, a, b, cin, cout, sum);
  end


  initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, testbench);
  end
  
  
  
endmodule
  
  