module lab3_top(SW,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR);
  input [9:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  output [9:0] LEDR;

  reg [31:0] counter;

  wire rst = ~KEY[0];
  wire clk = ~KEY[3];

  // 7-segment display
  wire [6:0] sseg0_output_0;
  seven_seg sseg0(
    .n(counter[3:0]), 
    .__output_0(sseg0_output_0), 
    .__ready(1'b1), 
    .__clock(clk), 
    .__reset(rst), 
    .__start(1'b1)
  );
  
  // Fib
  wire [31:0] f0_output_0;
  wire f0_valid;
  wire f0_done;
  reg f0_start;
  reg f0_ready;
  fib f0(
    .n(32'd100),
    .__output_0(f0_output_0),

    .__start(f0_start),
    .__ready(f0_ready),

    .__valid(f0_valid),
    .__done(f0_done),

    .__clock(clk),
    .__reset(rst),
  );

  assign HEX0 = ~sseg0_output_0; // Workaround as python2verilog does not support bitwise not  
  assign LEDR[0] = f0_valid;
  assign LEDR[1] = f0_done;
  assign LEDR[2] = f0_start;
  assign LEDR[3] = f0_ready;

  assign LEDR[8] = clk;
  assign LEDR[9] = rst;

  always @(posedge clk) begin
    // Fib
    if (rst) begin // Remember to hold clk and rst to reset
      f0_start <= 1;
      f0_ready <= 1;
    end else begin
      f0_start <= 0;
      if (1) begin
        counter <= f0_output_0;
      end
    end

  end
endmodule
