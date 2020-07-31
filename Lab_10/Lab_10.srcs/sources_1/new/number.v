`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 22:00:00
// Design Name: 
// Module Name: number
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


module number(
    input clk,
    input [1:0]left,
    input [1:0]right,
    output reg [32:0]num1,
    output reg [32:0]num2,
    output reg [32:0]num3,
    output reg [1:0]left1,
    output reg [1:0]left2,
    output reg [1:0]left3,
    output reg [1:0]right1,
    output reg [1:0]right2,
    output reg [1:0]right3
    );
    reg [32:0]cnt;
    always@(posedge clk)
    begin
        if(cnt>=1000000000)
                begin                                               
                if(num1==0)
                    begin
                        left1<=left;
                        right1<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num2==72000000)
                    begin
                        left2<=left;
                        right2<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num3==144000000)
                    begin
                        left3<=left;
                        right3<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num1==216000000)
                    begin
                        num1<=0;
                        num2<=num2;
                        num3<=num3;
                    end
                else if(num2==288000000)
                    begin
                        num2<=72000000;
                        num1<=num1;
                        num3<=num3;
                    end
                else if(num3==360000000)
                    begin
                        num3<=144000000;
                        num1<=num1;
                        num2<=num2;
                    end
                else
                    begin
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end      
             
                end
            else cnt<=cnt+1;
                  
    end
    
endmodule
