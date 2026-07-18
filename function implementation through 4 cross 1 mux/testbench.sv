// Code your testbench here
// or browse Examples
module testbench;

    reg A, B, C, D;
    wire F;

    function_using_mux dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F)
    );

    integer i;

    initial begin
        $monitor("Time=%0t A=%b B=%b C=%b D=%b F=%b",
                  $time, A, B, C, D, F);

        for (i = 0; i < 16; i = i + 1) begin
            {A, B, C, D} = i;
            #10;
        end

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
    end

endmodule
