module tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire carry;

    carry_look_ahead_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    integer i, j, k;

    initial begin
        for (k = 0; k < 2; k = k + 1) begin
            cin = k;
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    a = i;
                    b = j;
                    #10;

                    if ({carry, sum} !== (a + b + cin))
                        $display("ERROR: a=%0d b=%0d cin=%0d Expected=%0d Got=%0d",
                                 a, b, cin, a + b + cin, {carry, sum});
                end
            end
        end

        $display("All test cases completed.");
        $finish;
    end

   
    initial begin
        $monitor("Time=%0t | a=%d b=%d cin=%b | sum=%d carry=%b",
                 $time, a, b, cin, sum, carry);
    end

    
    initial begin
        $dumpfile("cla.vcd");
        $dumpvars(0, tb);
    end

endmodule