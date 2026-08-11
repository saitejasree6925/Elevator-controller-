`timescale 1ns/1ps

module elevator_controller_tb;

    reg        clk;
    reg        reset;
    reg [1:0]  request_floor;

    wire [1:0] current_floor;
    wire       up;
    wire       down;
    wire       door_open;

    // Instantiate DUT
    elevator_controller DUT (
        .clk(clk),
        .reset(reset),
        .request_floor(request_floor),
        .current_floor(current_floor),
        .up(up),
        .down(down),
        .door_open(door_open)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize
        clk = 0;
        reset = 1;
        request_floor = 2'b00;

        #10;

        // Release reset
        reset = 0;

        // Request Floor 3
        request_floor = 2'b11;
        #50;

        // Request Floor 1
        request_floor = 2'b01;
        #30;

        // Request Floor 0
        request_floor = 2'b00;
        #20;

        // Request Floor 2
        request_floor = 2'b10;
        #30;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor(
            "Time=%0t | Request=%d | Current Floor=%d | UP=%b | DOWN=%b | Door=%b",
            $time,
            request_floor,
            current_floor,
            up,
            down,
            door_open
        );
    end

    // Generate waveform
    initial begin
        $dumpfile("elevator_controller.vcd");
        $dumpvars(0, elevator_controller_tb);
    end

endmodule