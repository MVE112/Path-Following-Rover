`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 08:12:52 PM
// Design Name: Path-Following_Rover
// Module Name: TopM
// Project Name: Path-Following-Rover
// Target Devices: BASYS 3 BOARD
// Tool Versions: Vivado 2022
// Description: This is the top module that connects all of the files together. It also has inputs and outputs for all of the files to be able to cnnect and talk to eachother
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopM(
    input clock,
    input reset,
    input FPhoto,
    input SPhoto,
    input GPhoto,
    input [2:0] SIGNAL,
    input reg_one,
    input reg_two,
    output PWM_One,
    output PWM_Two,
    output servoA,
    output F_One,
    output B_One,
    output F_Two,
    output B_Two,
    output [3:0] an,
    output a, b, c, d, e, f, g, dp
    );
    
wire[1:0] Ffreq;
wire[1:0] Sfreq;
wire[1:0] Gfreq;
wire[7:0] positionServo;
//Frequency Module
FRQ u0(.*
);
//Seven segment display Module
Seven_Segment u1(.*
);
//Pathing module
Pathing u2(.*
);
servoAim u3(.*
);

endmodule
