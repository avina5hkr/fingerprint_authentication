`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2018 09:56:59
// Design Name: 
// Module Name: main
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


module block_ram(
    input clk,
    input we,
    input [7:0] di,
    output reg [7:0] data_out,
    output reg success
    );
    
    reg[7:0] do;
 
    reg succ;
    integer a=0;
    integer count;
    reg    [7:0] ram [15:0]; 
	

 
   always @ (we,di)
    begin
    
   if(we) begin
            ram[a] <= di;
            a=(a+1)%16;
            succ =1;
        end
    else 
     succ =0;
     
        begin
              for(count=0; count<16; count=(count+1))
                  begin
                       if (di == ram[count]) begin
                           do= di;
                           succ =1;
                         end
                     end                   
                       
             end
     
        
    
    success = succ;
    data_out = do;
    end
    
    endmodule



