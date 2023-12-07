`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TTU
// Engineer: Miguel Velasco Espinosa
// 
// Create Date: 04/25/2022 07:47:57 PM
// Design Name: Frequency
// Module Name: IPS
// Project Name: Path-Following-Rover
// Target Devices: BASYS 3 BOARD
// Tool Versions: Vivado 2022
// Description: Uses phototransistors to detect frequency between red and blue LEDs
// 
// Dependencies: 
// 
// Revision:
// Revision 1.2 - Final Frequency Code
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module FRQ(
    input clock,
    input FPhoto,
    input SPhoto,
    input GPhoto,
    output reg[1:0] Ffreq,
    output reg[1:0] Sfreq,
    output reg[1:0] Gfreq,
    output reg[7:0] positionServo
    );
    
    localparam N = 18;
    parameter countTo = 10000000; //50,000,000 is about 1 sec
    //These registers are used for IPS and PWM control
    reg [N - 1: 0] SS_counter;
    reg [26:0] counter = 0;
    reg Fold = 0;
    reg Sold = 0;
    reg Gold = 0;
    reg [15:0] Fcount = 0;
    reg [15:0] Scount = 0;
    reg [15:0] Gcount = 0;
    reg [15:0] Fout = 0;
    reg [15:0] Sout = 0;
    reg [15:0] Gout = 0;

always @(posedge clock) begin
    counter <= counter + 1;
    //Fphot and Sphoto determine the frequency by counting whenever the previous Frequency changes meaning the frequency is translated into a number the FPGA can understand
    if(FPhoto != Fold)
    begin
        Fcount <= Fcount + 1;
    end
    else if(SPhoto != Sold)
    begin
        Scount <= Scount + 1;
    end
    //GPhoto is from an earlier version however the code breaks when taken off(DO NOT TOUCH)
    else if(GPhoto != Gold)
    begin
        Gcount <= Gcount + 1;
    end
    
    if(counter == countTo)
    begin
        counter <= 0;
        //Performs right shift operation to deal with overflow (I dont know if this is what it actually does but it makes so that the readings are more consistent)
        Fout <= Fcount >> 1;
        Sout <= Scount >> 1;
        Gout <= Gcount >> 1;
        //Counts get reset to 0
        Fcount <= 0;
        Scount <= 0;
        Gcount <= 0;
    end
    //Frequencies get set to a new "Old" frequency
    Fold = FPhoto;
    Sold = SPhoto;
    Gold = GPhoto;
end

always @(posedge clock) begin
    //Since the frequency determines if its enemy or foe a 01 is a friendy and a 10 is a foe. Edge case accounted for in case different frequency is detected
    //Frequency between 10 and 40 is a friendy while above 40 and below 110 its an enemy
    if(Fout > 10 && Fout < 40) begin
        Ffreq <= 2'b01;
        positionServo <= 8'b00010000;
    end
    else if(Fout > 40 && Fout < 110) begin
        Ffreq <= 2'b10;
        //The servo position is used to aim the gun F is on the right side of the rover wile S is on the left. G as explained earlier does not do anything but if removed it breaks. (NEEDS UPDATE)
        positionServo <= 8'b00000001;
    end
    else begin
        Ffreq <= 2'b00;
        positionServo <= 8'b00010000;
    end
    
    if(Sout > 10 && Sout < 40) begin
        Sfreq <= 2'b01; //friend
        positionServo <= 8'b00010000;
    end
    else if(Sout > 40 && Sout < 110) begin
        Sfreq <= 2'b10; //criminal
        positionServo <= 8'b10000000;
    end
    else begin
        Sfreq <= 2'b00;
        positionServo <= 8'b00010000;
    end
    
    if (Gout > 10 && Gout < 40)begin
        Gfreq <= 2'b01;
        positionServo <= 8'b00010000;
    end
    else if (Gout > 40 && Gout < 110) begin
        Gfreq <= 2'b10;
    end
    else begin
        Gfreq <= 2'b00;
    end
end
endmodule
