`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 22:09:05
// Design Name: 
// Module Name: judge
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


module judge(
    input clk,
    input [11:0]set1x,
    input [11:0]set1y,
    input [11:0]set2x,
    input [11:0]set2y,
    
    input [11:0]a1x,
    input [11:0]a1y,
    input [11:0]a2x,
    input [11:0]a2y,
   
    input [11:0]b1x,
    input [11:0]b1y,
    input [11:0]b2x,
    input [11:0]b2y,
    
    input [11:0]c1x,
    input [11:0]c1y,
    input [11:0]c2x,
    input [11:0]c2y,
    
    output reg flag

    );
    
    always@(posedge clk)
    begin
        if(set1x==a1x)
            begin
                if(set1y>a1y-35&&set1y<a1y+35)  flag<=1;
                else flag<=0;
            end
        if(set1x==b1x)
            begin
                if(set1y>b1y-35&&set1y<b1y+35)  flag<=1;
                else flag<=0;
            end
        if(set1x==c1x)
            begin
                if(set1y>c1y-35&&set1y<c1y+35)  flag<=1;
                else flag<=0;
            end
        if(set2x==a2x)
            begin
                if(set2y>a2y-35&&set1y<a2y+35)  flag<=1;
                else flag<=0;
            end
        if(set2x==b2x)
            begin
                if(set2y>b2y-35&&set1y<b2y+35)  flag<=1;
                else flag<=0;
            end
        if(set2x==c2x)
            begin
                if(set2y>c2y-35&&set1y<c2y+35)  flag<=1;
                else flag<=0;
            end
    end
    
endmodule
