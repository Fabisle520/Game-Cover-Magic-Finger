`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/23 15:28:38
// Design Name: 
// Module Name: TestBench
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


module TestBench();

    reg clk;
    wire [1:0]left;
    wire [1:0]right;    
    
    control test(
        .clk(clk),
        .left(left),
        .right(right)
    );
    
    initial
        begin
        clk=0;
        end
    always #5 clk=~clk;
endmodule
