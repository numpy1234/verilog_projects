
module testbench();
  reg [1:0] selection;
  reg [3:0] inputlines;
  
  wire out;
  
  four_cross_1mux dut(.s(selection), .d(inputlines), .y(out));
  
  initial begin
    inputlines = 4'b0101;
    selection= 2'b00;
    #5;
    selection = 2'b01;
    #5
    selection = 2'b10;
    #5
    selection =2'b11;
    #5
    $finish();
  end
  
  initial begin 
    $monitor("time=%0t inputlines=%b selection=%b out=%b",
         $time, inputlines, selection, out);
  end
  

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule


  
    
  
  
  