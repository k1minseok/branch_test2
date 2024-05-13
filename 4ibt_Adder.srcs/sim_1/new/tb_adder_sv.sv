`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/09 11:39:52
// Design Name: 
// Module Name: tb_adder_sv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

class transaction;
    rand bit [3:0] a;
    rand bit [3:0] b;
endclass

module tb_adder_sv();

    
    reg [3:0] a;
    reg [3:0] b;
    wire[3:0] sum;
    wire      co;

    transaction trans;


    Adder dut ( // design under test
        .a  (a),
        .b  (b),
        .cin(1'b0),
        .sum(sum),
        .co (co)
    );

    initial begin
        trans = new();

        for (int i = 0; i < 100; i++) begin
            trans.randomize();
            a = trans.a;
            b = trans.b;
            #10 $display("a: %d + b: %d", trans.a, trans.b);
            if((a+b) == sum) begin
                $display("passed!");
            end
            else begin
                $display("failed!");
            end
        end
        #10 $finish;
    end

endmodule

