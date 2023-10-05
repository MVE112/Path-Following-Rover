`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TTU
// Engineer: Miguel Velasco Espinosa
// 
// Create Date: 04/25/2022 10:37:56 PM
// Design Name: Path-Following
// Module Name: Pathing
// Project Name: Path-Following
// Target Devices: BASYS 2 BOARD
// Tool Versions: Vivado 2022
// Description: Using IPS sensors follow a metallic path including a 90 degree turn
// 
// 
// 
// Revision:
// Revision 1.4 - Final Path Module
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Pathing(
    input[1:0] Ffreq,
    input[1:0] Sfreq,
    input clock,
    input [2:0] SIGNAL,
    input reset,
    input reg_one,
    input reg_two,
    output PWM_One,
    output PWM_Two,
    output F_One,
    output B_One,
    output F_Two,
    output B_Two
    );
    localparam normalSpeed = 2000000;
    localparam FRQDetectedSpeed = 1000000;
    reg [20:0] counter = 0;
    reg [20:0] width = 0;
    reg temp_PWM_One = 0;
    reg temp_PWM_Two = 0;
    reg temp_F_One = 0;
    reg temp_B_One = 0;
    reg temp_F_Two = 0;
    reg temp_B_Two = 0;
     always @(posedge clock) begin
        if(reset)
            counter <=0;
        else
            counter <= counter + 1;
            
        if(counter < width)
        begin
            temp_PWM_One <= 1;
            temp_PWM_Two <= 1;
            end
        else
        begin
            temp_PWM_One <= 0;
            temp_PWM_Two <= 0;
            end
      end
     always @(posedge clock) begin
     if(Ffreq >= 1 || Sfreq >= 1) begin
     width = FRQDetectedSpeed;
     end
     else begin
     width = normalSpeed;
     end
     end
     
     always @(posedge clock) begin
     case(SIGNAL)
        3'b111: begin
        temp_F_One = 1;
        temp_F_Two = 1;
        temp_B_One = 0;
        temp_B_Two = 0;
        end
        3'b110: begin
        temp_F_One = 1;
        temp_F_Two = 1;
        temp_B_One = 0;
        temp_B_Two = 0;
        end
        3'b100: begin
        temp_F_One = 1;
        temp_F_Two = 0;
        temp_B_One = 0;
        temp_B_Two = 1;
        end
        3'b101: begin
        temp_F_One = 1;
        temp_F_Two = 1;
        temp_B_One = 0;
        temp_B_Two = 0;
        end
        3'b010: begin
        temp_F_One = 0;
        temp_F_Two = 1;
        temp_B_One = 1;
        temp_B_Two = 0;
        end
        3'b011: begin
        temp_F_One = 0;
        temp_F_Two = 1;
        temp_B_One = 1;
        temp_B_Two = 0;
        end
        3'b001: begin
        temp_F_One = 0;
        temp_F_Two = 0;
        temp_B_One = 1;
        temp_B_Two = 1;
        end
        default: begin
        temp_F_One = 0;
        temp_F_Two = 0;
        temp_B_One = 1;
        temp_B_Two = 1;
        end
     endcase
     end
     assign PWM_One = temp_PWM_One;
     assign PWM_Two = temp_PWM_Two;
     assign F_One = temp_F_One;
     assign F_Two = temp_F_Two;
     assign B_One = temp_B_One;
     assign B_Two = temp_B_Two;

endmodule
