`timescale 1ns / 1ps

module Adder (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output co
);
    wire [2:0] w_carry;

    fullAdder U_FA0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),  // 1bit 이진수 0 
        .sum(sum[0]),
        .cout(w_carry[0])
    );

    fullAdder U_FA1 (
        .a(a[1]),
        .b(b[1]),
        .cin(w_carry[0]),  // 1bit 이진수 0 
        .sum(sum[1]),
        .cout(w_carry[1])
    );

    fullAdder U_FA2 (
        .a(a[2]),
        .b(b[2]),
        .cin(w_carry[1]),  // 1bit 이진수 0 
        .sum(sum[2]),
        .cout(w_carry[2])
    );
    
    fullAdder U_FA3 (
        .a(a[3]),
        .b(b[3]),
        .cin(w_carry[2]),  // 1bit 이진수 0 
        .sum(sum[3]),
        .cout(co)
    );

endmodule


module halfAdder (
    input  a,
    input  b,
    output sum,
    output carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

module fullAdder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    wire w_sum1, w_carry1, w_carry2;

    halfAdder U_HA1 (
        .a(a),
        .b(b),
        .sum(w_sum1),
        .carry(w_carry1)
    );


    halfAdder U_HA2 (
        .a(w_sum1),
        .b(cin),
        .sum(sum),
        .carry(w_carry2)
    );

    assign cout = w_carry1 | w_carry2;
endmodule


