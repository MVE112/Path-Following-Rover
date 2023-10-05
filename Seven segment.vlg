`timescale 1ns / 1ps


module Seven_Segment(
    input clock,
    input [1:0] Ffreq,
    input [1:0] Sfreq,
    output [3:0] an,
    output a, b, c, d, e, f, g, dp
    );
    
    reg [6:0] temp_sseg = 0;
    reg [3:0] temp_an = 0;
    //Checks to see if a friendly (1) or criminal (2) is detected
    always @(posedge clock) begin
    if(Sfreq == 2 || Ffreq ==2) begin
    //Changes the seven segment display to display in this case a C
    temp_an = 4'b1110;
    temp_sseg = 7'b1000110;
    end
    //Displays an F
    else if(Sfreq == 1 || Ffreq == 1) begin
    temp_an = 4'b1110;
    temp_sseg = 7'b0001110;
    end
    //Displays a - for not detecting a frequency
    else begin
    temp_an = 4'b1110;
    temp_sseg = 7'b0111111;
    end
    end
    assign {g, f, e, d, c, b, a} = temp_sseg;
    assign an = temp_an;
endmodule
