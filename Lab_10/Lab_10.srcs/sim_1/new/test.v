`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/23 14:03:59
// Design Name: 
// Module Name: test
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


module test();
    reg clk_100MHz;                       
    wire RGB_HSync;         
    wire RGB_VSync;          
    wire RGB_VDE;           
    
    Lab_10 testbench(
        .clk_100MHz(clk_100MHz),
        .RGB_HSync(RGB_HSync),
        .RGB_VSync(RGB_VSync),
        .RGB_VDE(RGB_VDE)
    );
    
    initial
        begin
        clk_100MHz=0;
        end
    always #5 clk_100MHz=~clk_100MHz;
endmodule
