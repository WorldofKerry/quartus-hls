module fib (
    // Function parameters (only need to be set when start is high):
    input wire signed [31:0] n,

    input wire __clock, // clock for sync
    input wire __reset, // set high to reset, i.e. done will be high
    input wire __start, // set high to capture inputs (in same cycle) and start generating

    // Implements the ready/valid handshake
    input wire __ready, // set high when caller is ready for output
    output reg __valid, // is high if output values are valid

    output reg __done, // is high if module done outputting

    // Output values as a tuple with respective index(es)
    output reg signed [31:0] __output_0
);
    // State variables
    localparam _state0_assign0 = 0;
    localparam _state3_while = 1;
    localparam _state3_while0_assign0 = 2;
    localparam _state_done = 3;
    localparam _state_done_assign0 = 4;
    localparam _state_idle = 5;
    reg [31:0] _state;
    // Local variables
    reg signed [31:0] _a;
    reg signed [31:0] _b;
    reg signed [31:0] _count;
    reg signed [31:0] _n;
    // Core
    always @(posedge __clock) begin
        `ifdef DEBUG
        $display("fib,%s,__start=%0d,__done=%0d,__ready=%0d,__valid=%0d,n=%0d,_n=%0d,__output_0=%0d,_a=%0d,_b=%0d,_count=%0d", _state.name, __start, __done, __ready, __valid, n, _n, __output_0, _a, _b, _count);
        `endif
        if (__ready) begin
            __valid <= 0;
            __done <= 0;
        end
        // Start signal takes precedence over reset
        if ((__reset || __start)) begin
            _state <= _state_idle;
            __done <= 0;
            __valid <= 0;
        end
        if (__start) begin
            _n <= n;
            _a <= $signed(0);
            _b <= $signed(1);
            _count <= $signed(0);
            if (($signed(0) < n)) begin
                __output_0 <= $signed(0);
                __valid <= 1;
                _a <= $signed(1);
                _b <= $signed($signed(0) + $signed(1));
                _count <= $signed($signed(0) + $signed(1));
                _state <= _state3_while;
            end else begin
                __done <= 1;
                __valid <= 1;
                _state <= _state_idle;
            end
        end else begin
            // If ready or not valid, then continue computation
            if ((__ready || !(__valid))) begin
                case (_state)
                    _state3_while: begin
                        if ((_count < _n)) begin
                            __output_0 <= _a;
                            __valid <= 1;
                            _a <= _b;
                            _b <= $signed(_a + _b);
                            _count <= $signed(_count + $signed(1));
                            if (($signed(_count + $signed(1)) < _n)) begin
                                _state <= _state3_while0_assign0;
                            end else begin
                                _state <= _state_done_assign0;
                            end
                        end else begin
                            __done <= 1;
                            __valid <= 1;
                            _state <= _state_idle;
                        end
                    end
                    _state3_while0_assign0: begin
                        __output_0 <= _a;
                        __valid <= 1;
                        _a <= _b;
                        _b <= $signed(_a + _b);
                        _count <= $signed(_count + $signed(1));
                        if (($signed(_count + $signed(1)) < _n)) begin
                            _state <= _state3_while0_assign0;
                        end else begin
                            _state <= _state_done_assign0;
                        end
                    end
                    _state_done_assign0: begin
                        __done <= 1;
                        __valid <= 1;
                        _state <= _state_idle;
                    end
                endcase
            end
        end
    end
endmodule

module seven_seg (
    // Function parameters (only need to be set when start is high):
    input wire signed [31:0] n,

    input wire __clock, // clock for sync
    input wire __reset, // set high to reset, i.e. done will be high
    input wire __start, // set high to capture inputs (in same cycle) and start generating

    // Implements the ready/valid handshake
    input wire __ready, // set high when caller is ready for output
    output reg __valid, // is high if output values are valid

    output reg __done, // is high if module done outputting

    // Output values as a tuple with respective index(es)
    output reg signed [31:0] __output_0
);
    // State variables
    localparam _state0 = 0;
    localparam _state_done = 1;
    localparam _state_idle = 2;
    reg [31:0] _state;
    // Local variables
    reg signed [31:0] _n;
    // Core
    always @(posedge __clock) begin
        `ifdef DEBUG
        $display("seven_seg,%s,__start=%0d,__done=%0d,__ready=%0d,__valid=%0d,n=%0d,_n=%0d,__output_0=%0d", _state.name, __start, __done, __ready, __valid, n, _n, __output_0);
        `endif
        if (__ready) begin
            __valid <= 0;
            __done <= 0;
        end
        // Start signal takes precedence over reset
        if ((__reset || __start)) begin
            _state <= _state_idle;
            __done <= 0;
            __valid <= 0;
        end
        if (__start) begin
            _n <= n;
            _state <= _state;
            _state <= _state;
            if ((n === $signed(0))) begin
                __output_0 <= $signed(192);
                __done <= 1;
                __valid <= 1;
                _state <= _state_idle;
            end else begin
                if ((n === $signed(1))) begin
                    __output_0 <= $signed(249);
                    __done <= 1;
                    __valid <= 1;
                    _state <= _state_idle;
                end else begin
                    if ((n === $signed(2))) begin
                        __output_0 <= $signed(164);
                        __done <= 1;
                        __valid <= 1;
                        _state <= _state_idle;
                    end else begin
                        if ((n === $signed(3))) begin
                            __output_0 <= $signed(176);
                            __done <= 1;
                            __valid <= 1;
                            _state <= _state_idle;
                        end else begin
                            if ((n === $signed(4))) begin
                                __output_0 <= $signed(153);
                                __done <= 1;
                                __valid <= 1;
                                _state <= _state_idle;
                            end else begin
                                if ((n === $signed(5))) begin
                                    __output_0 <= $signed(146);
                                    __done <= 1;
                                    __valid <= 1;
                                    _state <= _state_idle;
                                end else begin
                                    if ((n === $signed(6))) begin
                                        __output_0 <= $signed(130);
                                        __done <= 1;
                                        __valid <= 1;
                                        _state <= _state_idle;
                                    end else begin
                                        if ((n === $signed(7))) begin
                                            __output_0 <= $signed(248);
                                            __done <= 1;
                                            __valid <= 1;
                                            _state <= _state_idle;
                                        end else begin
                                            if ((n === $signed(8))) begin
                                                __output_0 <= $signed(128);
                                                __done <= 1;
                                                __valid <= 1;
                                                _state <= _state_idle;
                                            end else begin
                                                if ((n === $signed(9))) begin
                                                    __output_0 <= $signed(144);
                                                    __done <= 1;
                                                    __valid <= 1;
                                                    _state <= _state_idle;
                                                end else begin
                                                    __output_0 <= $signed(0);
                                                    __done <= 1;
                                                    __valid <= 1;
                                                    _state <= _state_idle;
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end else begin
            // If ready or not valid, then continue computation
            if ((__ready || !(__valid))) begin
                // case(_state)
                //Empty case block
                // endcase
            end
        end
    end
endmodule

