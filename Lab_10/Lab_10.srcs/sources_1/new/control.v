`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 20:01:48
// Design Name: 
// Module Name: control
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


module control(
//    input Key0,
//    input Key1,
    input clk,
    output reg [1:0]left,
    output reg [1:0]right
//    output reg left,
//    output reg right
    );       

    reg[32:0] num;
    reg b;
    always@(posedge clk)      
    begin
        if(num==0)
            begin
            left<=2'b00;
            right<=2'b00;          
            num<=num+1; 
            end
        else if(num==100000000||num==700000000||num==1100000000)
            begin
            left<=2'b00;
            right<=2'b01;
            num<=num+1;
            end
        else if(num==200000000||num==500000000||num==1000000000)
            begin
            left<=2'b01;
            right<=2'b01;
            num<=num+1;
            end
        else if(num==400000000||num==600000000||num==1200000000)
            begin
            left<=2'b01;
            right<=2'b00;
            if(num/1200000000==1)
            num<=100000000;
            else num<=num+1;
            end
        else if(num==300000000||num==800000000||num==900000000)
            begin
            left<=2'b00;
            right<=2'b00;
            num<=num+1;
            end
        else  num<=num+1;
    end

endmodule
