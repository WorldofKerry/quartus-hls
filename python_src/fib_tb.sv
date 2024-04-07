/*
# Python Function
@verilogify
def fib(n):
    a = 0
    b = 1
    count = 0
    while count < n:
        yield a
        a, b = b, a + b
        count += 1

# Test Cases
print(list(fib(*(10,))))
*/
module fib_tb (
);
    reg __clock;
    reg __start;
    reg __reset;
    reg __ready;
    reg signed [31:0] n;
    wire __done;
    wire __valid;
    wire signed [31:0] __output_0;
    fib DUT (
        .__clock(__clock),
        .__start(__start),
        .__reset(__reset),
        .__ready(__ready),
        .n(n),
        .__done(__done),
        .__valid(__valid),
        .__output_0(__output_0)
        );
    always #5 __clock = !__clock;
    initial begin
        __clock = 0;
        __start = 0;
        __ready = 1;
        __reset = 1;
        @(negedge __clock);
        __reset = 0;
        // ============ Test Case 0 with arguments (10,) ============
        n = $signed(10);
        __start = 1;
        @(negedge __clock);
        n = 'x; // only need inputs when start is set
        __start = 0;
        while ((!(__done) || !(__ready))) begin
            @(posedge __clock);
            if (__ready) begin
                $display("%0d, %0d, %0d", __ready, __valid, __output_0);
            end
            @(negedge __clock);
        end
        $finish;
    end
endmodule

/*
# Python Function
@verilogify
def seven_seg(n):
    """
    Seven segment display
    """
    if n == 0:
        return 63
    elif n == 1:
        return 6
    elif n == 2:
        return 91
    elif n == 3:
        return 79
    elif n == 4:
        return 102
    elif n == 5:
        return 109
    elif n == 6:
        return 125
    elif n == 7:
        return 7
    elif n == 8:
        return 127
    elif n == 9:
        return 111
    else:
        return 0

# Test Cases
print(list(seven_seg(*(9,))))
*/
module seven_seg_tb (
);
    reg __clock;
    reg __start;
    reg __reset;
    reg __ready;
    reg signed [31:0] n;
    wire __done;
    wire __valid;
    wire signed [31:0] __output_0;
    seven_seg DUT (
        .__clock(__clock),
        .__start(__start),
        .__reset(__reset),
        .__ready(__ready),
        .n(n),
        .__done(__done),
        .__valid(__valid),
        .__output_0(__output_0)
        );
    always #5 __clock = !__clock;
    initial begin
        __clock = 0;
        __start = 0;
        __ready = 1;
        __reset = 1;
        @(negedge __clock);
        __reset = 0;
        // ============ Test Case 0 with arguments (9,) ============
        n = $signed(9);
        __start = 1;
        @(negedge __clock);
        n = 'x; // only need inputs when start is set
        __start = 0;
        while ((!(__done) || !(__ready))) begin
            @(posedge __clock);
            if (__ready) begin
                $display("%0d, %0d, %0d", __ready, __valid, __output_0);
            end
            @(negedge __clock);
        end
        if (__ready) begin
            $display("%0d, %0d, %0d", __ready, __valid, __output_0);
        end
        $finish;
    end
endmodule

