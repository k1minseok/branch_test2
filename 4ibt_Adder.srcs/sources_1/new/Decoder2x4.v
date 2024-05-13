`timescale 1ns / 1ps


module Decoder2x4 (
    input  [1:0] x,
    output reg [3:0] y
);

    always @(x) begin
        case (x)
            2'h0: y = 4'b1110;
            2'h1: y = 4'b1101;
            2'h2: y = 4'b1011;
            2'h3: y = 4'b0111;
        endcase
    end
endmodule
