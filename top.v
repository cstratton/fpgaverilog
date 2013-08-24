`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:55 08/14/2013 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
	   input 	 clk,
	   input 	 rst,
//	   output [15:0] tp,
	   output 	 a,
	   output 	 b,
	   output 	 c,
	   input 	 spi_clk, spi_mosi, spi_ssel_n,
	   output 	 spi_miso, 
	   input [7:0] 	 adc_d,
	   input 	 adc_clk,
	   output 	 led
	   );

   reg [23:0] 		 count;
   reg [2:0] 		 spi_clk_reg;
   reg 			 spi_mosi_reg;
   reg [15:0] 		 spi_idr;
   reg 			 ssel_reg;
   reg [7:0] 		 spi_odr;
   
//   assign tp = count;
   assign a = clk;
   assign b = spi_ssel_n;
   assign c = adc_clk;

//   assign spi_miso = (spi_ssel_n) ? 1'bz : spi_odr[7];
   assign spi_miso = spi_odr[7];   

//   assign adc_clk = clk;
   assign led = (spi_idr[15]) ? count[20] : count[23];
   
   always @(posedge adc_clk) begin
      count <= count + 1'b1;
      
      ssel_reg <= ~spi_ssel_n;
      spi_clk_reg <= {spi_clk_reg[1:0], spi_clk};
      spi_mosi_reg <= spi_mosi;
      
      if (ssel_reg == 1'b1) begin
	 if (spi_clk_reg == 3'b001) begin
	    spi_idr <= {spi_idr[14:0], spi_mosi_reg};
	    spi_odr <= {spi_odr[6:0], spi_idr[7]};
	 end
      end
      else begin
	 spi_odr <= adc_d;
      end
   end
	

endmodule
