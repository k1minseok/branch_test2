`timescale 1ns / 1ps


module DigitSplitter(
    input [13:0] i_digit,
    output [3:0] o_digit_1,
    output [3:0] o_digit_10,
    output [3:0] o_digit_100,
    output [3:0] o_digit_1000
    );

    assign o_digit_1 = i_digit % 10;                // 1의 자리
    assign o_digit_10 = i_digit / 10 % 10;          // 10의 자리
    assign o_digit_100 = i_digit / 100 % 10;        // 100의 자리
    assign o_digit_1000 = i_digit / 1000 % 10;      // 1000의 자리

endmodule
