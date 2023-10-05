//////////////////////////////////////////////////////////////////////////////////
// Company: TTU 
// Engineer: Miguel Velasco Espinosa
// 
// Create Date: 04/25/2022 11:32:53 PM
// Design Name: Path-Following
// Module Name: servoAim
// Project Name: PAth-Following-Rover
// Target Devices: BASYS 3 BOARD
// Tool Versions: Vivado 2022
// Description: The Servo will aim depending on the frequency.vlg file detecting an enemy. When detecting frequency this code will send information to the Seven Segment.vlg file
// 
// Dependencies: 
// 
// Revision:
// Revision 1.4- Module Finished
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module servoAim(
    input clock,
    input reset,
    input [7:0] positionServo,
    output servoA
    );
    reg pwm_q, pwm_d;
    reg [19:0] ctr_q, ctr_d;
    assign servo = pwm_q;
always @(posedge clock)
begin
    ctr_d = ctr_q + 1'b1;
    if (positionServo + 9'd165 > ctr_q[19:8]) begin
      pwm_d = 1'b1;
    end else begin
      pwm_d = 1'b0;
    end
  end
	
  always @(posedge clock) begin
    if (reset) begin
      ctr_q <= 1'b0;
    end 
    else begin
      ctr_q <= ctr_d;
    end
    pwm_q <= pwm_d;
  end
endmodule
