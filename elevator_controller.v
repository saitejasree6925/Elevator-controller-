module elevator_controller (
    input  wire       clk,
    input  wire       reset,
    input  wire [1:0] request_floor,

    output reg  [1:0] current_floor,
    output reg        up,
    output reg        down,
    output reg        door_open
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_floor <= 2'b00;
            up            <= 1'b0;
            down          <= 1'b0;
            door_open     <= 1'b0;
        end
        else begin
            // Default outputs
            up        <= 1'b0;
            down      <= 1'b0;
            door_open <= 1'b0;

            // Move upward
            if (request_floor > current_floor) begin
                current_floor <= current_floor + 1'b1;
                up            <= 1'b1;
            end

            // Move downward
            else if (request_floor < current_floor) begin
                current_floor <= current_floor - 1'b1;
                down          <= 1'b1;
            end

            // Destination reached
            else begin
                door_open <= 1'b1;
            end
        end
    end

endmodule