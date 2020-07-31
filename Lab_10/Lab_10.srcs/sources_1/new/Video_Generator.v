`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/23 13:01:41
// Design Name: 
// Module Name: Video_Generator
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


module Video_Generator(
    input clk,
    input Key0,
    input Key1,
    input [1:0]left,
    input [1:0]right,
//    input left,
//    input right,
    input RGB_VDE,
    input [11:0]Set_X,
    input [11:0]Set_Y,
    output reg[23:0]RGB_Data=24'hffff00    //RBG
    );
    reg [13:0]Address0=0;
    reg [13:0]Address1=0;
 
    wire [7:0]R_Data=8'hff;
    wire [7:0]G_Data=0;
    wire [7:0]B_Data=0;
    
    wire [7:0]R_Data1=0;
    wire [7:0]G_Data1=0;
    wire [7:0]B_Data1=8'hff;
    
    wire [7:0]R_Data_game;
    wire [7:0]G_Data_game=0;
    wire [7:0]B_Data_game=0;
    wire [7:0]R_Data_over;
    wire [7:0]G_Data_over=0;
    wire [7:0]B_Data_over=0;
    
//    reg [32:0]num;
    reg [32:0]num1;
    reg [32:0]num2;
    reg [32:0]num3;

    reg [32:0]a;
    reg [32:0]b;
    reg [32:0]c;
    
    reg [1:0]left1;
    reg [1:0]left2;
    reg [1:0]left3;

    reg [1:0]right1;
    reg [1:0]right2;
    reg [1:0]right3;
    
    reg [11:0]set1x;
    reg [11:0]set1y;
    reg [11:0]set2x;
    reg [11:0]set2y;
    
    reg [11:0]a1x;
    reg [11:0]a1y;
    reg [11:0]a2x;
    reg [11:0]a2y;
    
    reg [11:0]b1x;
    reg [11:0]b1y;
    reg [11:0]b2x;
    reg [11:0]b2y;
    
    reg [11:0]c1x;
    reg [11:0]c1y;
    reg [11:0]c2x;
    reg [11:0]c2y;
    
    reg [32:0]cnt;
    reg flag;
        
    always@(posedge clk)
        begin
             if(flag==1)
                begin          
                    if(Key0==0)
                        begin
                            flag<=0;
                            num1<=0;
                            num2<=0;
                            num3<=0;
                            cnt<=0;
                            left1<=0;left2<=0;left3<=0;
                            right1<=0;right2<=0;right3<=0;
                        end
                    else
                        begin
                        if(Set_X>=860&&Set_X<960)
                            begin               
                            if(Set_Y>=490&&Set_Y<590)
                                begin     
                                    Address0=(Set_X-859)*100+(Set_Y-489);
                                    RGB_Data<={R_Data_game,B_Data_game,G_Data_game};       
                                end
                            end
                        else if(Set_X>=960&&Set_X<1060)
                            begin               
                            if(Set_Y>=490&&Set_Y<590)
                                begin     
                                    Address1=(Set_X-959)*100+(Set_Y-489);
                                    RGB_Data<={R_Data_over,B_Data_over,G_Data_over};       
                                end
                            end
                        else RGB_Data<=24'hffffff;
                        end
                                            
                end
              
            
            else
                begin                     
                if(cnt>=500000000)
                begin                                               
                if(num1==0)
                    begin
                        left1<=left;
                        right1<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num2==36000000)
                    begin
                        left2<=left;
                        right2<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num3==72000000)
                    begin
                        left3<=left;
                        right3<=right;
                        num1<=num1+1;
                        num2<=num2+1;
                        num3<=num3+1;
                    end
                else if(num1==108000000)
                    begin
                        num1<=0;
                        num2<=num2;
                        num3<=num3;
                    end
                else if(num2==144000000)
                    begin
                        num2<=36000000;
                        num1<=num1;
                        num3<=num3;
                    end
                else if(num3==180000000)
                    begin
                        num3<=72000000;
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
                else cnt=cnt+1;
                    
                if(Key0==0&&Key1==0)
                    begin
                        if(Set_Y>=915&&Set_Y<975)
                            begin
                               if(Set_X>=1650&&Set_X<1710)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1}; 
                                        set2x<=1680;
                                        set2y<=945;          
                                    end
                                else if(Set_X>=210&&Set_X<270)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1};   
                                        set1x<=240;
                                        set1y<=945;        
                                    end
                                else RGB_Data<=24'hffffff;  
                             end
                    end  
                else if(Key0==1&&Key1==0)
                   begin
                        if(Set_Y>=915&&Set_Y<975)
                            begin
                                if(Set_X>=1650&&Set_X<1710)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1}; 
                                        set2x<=1680;
                                        set2y<=945;          
                                    end
                                else if(Set_X>=690&&Set_X<750)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1};  
                                        set1x<=720;
                                        set1y<=945;         
                                    end
                                else RGB_Data<=24'hffffff;  
                             end
                    end
                else if(Key1==1&&Key0==1)
                    begin
                        if(Set_Y>=915&&Set_Y<975)
                            begin
                               if(Set_X>=690&&Set_X<750)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1};   
                                        set1x<=720;
                                        set1y<=945;         
                                    end
                                else if(Set_X>=1170&&Set_X<1230)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1};  
                                        set2x<=1200;
                                        set2y<=945;         
                                    end
                                else RGB_Data<=24'hffffff;  
                            end
                     end
                else if(Key1==1&&Key0==0)
                    begin
                        if(Set_Y>=915&&Set_Y<975)
                            begin
                                if(Set_X>=210&&Set_X<270)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1};  
                                        set1x<=240;
                                        set1y<=945;          
                                    end
                                else if(Set_X>=1170&&Set_X<1230)
                                    begin
                                        RGB_Data<={R_Data1,B_Data1,G_Data1}; 
                                        set2x<=1200;
                                        set2y<=945;          
                                    end
                                else RGB_Data<=24'hffffff;  
                            end
                    end        
                          
                a<=num1/100000;
                b<=num2/100000-360;
                c<=num3/100000-720;
        
                if(Set_Y>=a&&Set_Y<a+20)
                    begin               
                        if(Set_X>=20&&Set_X<460)
                            begin                       
                                if(left1==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};  
                                        a1x<=240;
                                        a1y<=a+10;
                                    end
                            end
                        else if(Set_X>=500&&Set_X<940)
                            begin
                               if(left1==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};      
                                        a1x<=720;
                                        a1y<=a+10;    
                                    end
                          end                  
                        else if(Set_X>=980&&Set_X<1420)
                            begin
                                if(right1==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};  
                                        a2x<=1200;
                                        a2y<=a+10;
                                    end
                            end
                        else if(Set_X>=1460&&Set_X<1900)
                            begin
                               if(right1==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};   
                                        a2x<=1680;
                                        a2y<=a+10;       
                                    end
                          end         
                        else 
                            RGB_Data<=24'hffffff;                                    
                    end    
                         
                else if(Set_Y>=b&&Set_Y<b+20)
                    begin
                        if(Set_X>=20&&Set_X<460)
                            begin                       
                                if(left2==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};  
                                        b1x<=240;
                                        b1y<=b+10;
                                    end
                            end
                        else if(Set_X>=500&&Set_X<940)
                            begin
                               if(left2==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};   
                                        b1x<=720;
                                        b1y<=b+10;       
                                    end
                          end                  
                        else if(Set_X>=980&&Set_X<1420)
                            begin
                                if(right2==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data}; 
                                        b2x<=1200;
                                        b2y<=b+10; 
                                    end
                            end
                        else if(Set_X>=1460&&Set_X<1900)
                            begin
                               if(right2==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};   
                                        b2x<=1680;
                                        b2y<=b+10;       
                                    end
                          end         
                        else 
                            RGB_Data<=24'hffffff;                                    
                    end    
                    
                else if(Set_Y>=c&&Set_Y<c+20)
                    begin
                        if(Set_X>=20&&Set_X<460)
                            begin                       
                                if(left3==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};  
                                        c1x<=240;
                                        c1y<=c+10;
                                    end
                            end
                        else if(Set_X>=500&&Set_X<940)
                            begin
                               if(left3==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data}; 
                                        c1x<=720;
                                        c1y<=c+10;         
                                    end
                          end                  
                        else if(Set_X>=980&&Set_X<1420)
                            begin
                                if(right3==2'b01)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};  
                                        c2x<=1200;
                                        c2y<=c+10;
                                    end
                            end
                        else if(Set_X>=1460&&Set_X<1900)
                            begin
                               if(right3==2'b00)
                                    begin
                                        RGB_Data<={R_Data,B_Data,G_Data};    
                                        c2x<=1680;
                                        c2y<=c+10;      
                                    end
                          end         
                        else 
                            RGB_Data<=24'hffffff;                                    
                    end    
               
               
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
                
                 
        end
    
    game_R_Rom R_Rom1(
        .clka(clk),
        .ena(1),
        .addra(Address0),
        .douta(R_Data_game)
    );
    
    over_R_Rom R_Rom2(
        .clka(clk),
        .ena(1),
        .addra(Address1),
        .douta(R_Data_over)
    );
    
//    number Signal(
//    .clk(clk),
//    .left(left),
//    .right(right),
//    .num1(num1),
//    .num2(num2),
//    .num3(num3),
//    .left1(left1),
//    .left2(left2),
//    .left3(left3),
//    .right1(right1),
//    .right2(right2),
//    .right3(right3)
//    );
    
//    judge Judgement(
//    .clk(clk),
//    .set1x(set1x),
//    .set1y(set1y),
//    .set2x(set2x),
//    .set2y(set2y),
    
//    .a1x(a1x),
//    .a1y(a1y),
//    .a2x(a2x),
//    .a2y(a2y),
   
//    .b1x(b1x),
//    .b1y(b1y),
//    .b2x(b2x),
//    .b2y(b2y),
    
//    .c1x(c1x),
//    .c1y(c1y),
//    .c2x(c2x),
//    .c2y(c2y),
    
//    .flag(flag)
//    );
      
endmodule
