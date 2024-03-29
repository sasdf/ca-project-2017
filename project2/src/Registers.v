module Registers
(
    clk_i,
    RSaddr_i,
    RTaddr_i,
    RDaddr_i, 
    RDdata_i,
    regwrite_i, 
    RSdata_o, 
    RTdata_o 
);

// Ports
input               clk_i;
input               regwrite_i;
input   [4:0]       RSaddr_i;
input   [4:0]       RTaddr_i;
input   [4:0]       RDaddr_i;
input   [31:0]      RDdata_i;

output  [31:0]      RSdata_o; 
output  [31:0]      RTdata_o;

// Register File
reg     [31:0]      register        [0:31];

// Read Data     
assign RSdata_o = (regwrite_i && (RSaddr_i==RDaddr_i) && RDaddr_i != 5'b0) ? RDdata_i : register[RSaddr_i];
assign RTdata_o = (regwrite_i && (RTaddr_i==RDaddr_i) && RDaddr_i != 5'b0) ? RDdata_i : register[RTaddr_i];

// Write Data   
always@(posedge clk_i) begin
    if(regwrite_i && RDaddr_i != 5'b0)
        register[RDaddr_i] <= RDdata_i;
end
   
endmodule 
