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
	   input       clk,
//	   input 	 rst,
//	   output [15:0] tp,
	   output      a,
	   output      b,
	   output      c,
	   input       spi_clk, spi_mosi, spi_ssel_n,
	   output      spi_miso, 
	   input [7:0] adc_d,
	   input       adc_clk,
	   output      led,
	   output      status     
	   );

   reg [23:0] 		 count;
   reg [2:0] 		 spi_clk_reg;
   reg 			 spi_mosi_reg;
   reg [15:0] 		 spi_idr;
   reg [2:0]		 ssel_reg;
   reg [7:0] 		 spi_odr;

   //2Kx9 2048 8 1 (7:0) (0:0) (10:0) RAMB16_S9 18K
   reg 			 mem_we;
   reg [7:0]		 mem_data;
   reg [7:0] 		 mem[8191:0];
   reg [7:0] 		 mem_q;
   reg [12:0] 		 mem_addr;

   reg [2:0] 		 bitcnt;
   
   
   always @(posedge adc_clk) begin
	mem_q <= mem[mem_addr];
      if (mem_we) mem[mem_addr] <= mem_data;
   end

   
//   assign tp = count;
   assign a = clk;
   assign b = spi_ssel_n;
   assign c = adc_clk;

//   assign spi_miso = (spi_ssel_n) ? 1'bz : spi_odr[7];
   assign spi_miso = spi_odr[7];   
   assign status = mem_we;   
//   assign adc_clk = clk;
   assign led = (spi_idr[15]) ? count[20] : count[23];

      
   always @(posedge adc_clk) begin
      if (spi_mosi_reg) 
	mem_data <= mem_addr[7:0]; 
      else
	mem_data <= adc_d; 
      count <= count + 1'b1;
      
      ssel_reg <= {ssel_reg[1:0], ~spi_ssel_n};
      spi_clk_reg <= {spi_clk_reg[1:0], spi_clk};
      spi_mosi_reg <= spi_mosi;
      
//      if (ssel_reg == 1'b1) begin
      //       if (sese
      if (ssel_reg == 3'b011) begin
	 mem_addr <= 1'b0;
	 mem_we <= 1'b0;
	 bitcnt <= 7;
      end
      if (ssel_reg == 3'b100) begin
	 mem_addr <= 0;
	 mem_addr <= 1'b1;
	 mem_we <= 1'b1;
      end
      if (ssel_reg == 3'b111) begin
	 if (spi_clk_reg == 3'b011) begin
	    spi_idr <= {spi_idr[14:0], spi_mosi_reg};
	    //spi_odr <= {spi_odr[6:0], spi_idr[7]};
	    bitcnt <= bitcnt + 1;
	    if (bitcnt == 5)
	      mem_addr <= mem_addr + 1;
	    if (bitcnt == 7)
	      spi_odr <= mem_q;
	    else
	      spi_odr <= {spi_odr[6:0], 1'b0};
	 end
      end
      if (ssel_reg == 3'b000) begin
	 if (mem_addr != 13'b1111111111111) begin
	    mem_addr <= mem_addr + 1;
	 end
	 else begin
	    mem_we <= 1'b0;
	 end
      end
   end
	

endmodule
