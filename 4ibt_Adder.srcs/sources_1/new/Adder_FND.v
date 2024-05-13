`timescale 1ns / 1ps

module Adder_FND (
    input  [3:0] a,        // input 4bit
    input  [3:0] b,        // input 4bit
    input  [1:0] fndSel,
    output [3:0] fndCom,   // FND Common
    output [7:0] fndFont,  // FND Segment
    output       carry
);


    wire [3:0] w_sum;
    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;
    wire [3:0] w_digit;

    Adder U_4bitAdder (
        .a  (a),
        .b  (b),
        .cin(1'b0),
        .sum(w_sum),
        .co (carry)
    );

    DigitSplitter U_DigitSplitter (
        .i_digit     ({9'b0, carry, w_sum}),  // i_digit : 14bit
        // {} : 비트 결합 연산자 -> MSB부터 9bit 0으로 채우고 Carry 1bit, w_sum 4bit
        .o_digit_1   (w_digit_1),
        .o_digit_10  (w_digit_10),
        .o_digit_100 (w_digit_100),
        .o_digit_1000(w_digit_1000)
    );

    MUX U_4x1MUX (
        .sel(fndSel),
        .x0 (w_digit_1),
        .x1 (w_digit_10),
        .x2 (w_digit_100),
        .x3 (w_digit_1000),
        .y  (w_digit)
    );

    BCDtoSEG U_BcdToSeg (
        .bcd(w_digit),
        .seg(fndFont)
        // output은 기본적으로 wire(레지스터 할당 X) 형태로 되어 있어 값을 저장하지 못함
        // -> ouput reg로 선언하면 저장 가능
    );

    Decoder2x4 U_2x4Decoder (
        .x(fndSel),
        .y(fndCom)
    );

endmodule
