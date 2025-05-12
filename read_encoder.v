module Read_Encoder (
    input wire clk,
    input wire rst_n,

    input wire A,
    input wire B,

    output reg [1:0] dir
);
reg A_prev;
reg B_prev;

reg [3:0] transition;

always @(posedge clk or negedge rst_n) 
begin
    if(!rst_n) 
    begin 
        A_prev <= 1'b0;
        B_prev <= 1'b0;
        dir    <= 2'b00;
    end 
    else 
    begin
        A_prev <= A;
        B_prev <= B;

        transition = {A_prev, B_prev, A, B};

        case(transition)
            4'b0001, 4'b0111, 4'b1110, 4'b1000: dir <= 2'b10;
            4'b0010, 4'b1011, 4'b1101, 4'b0100: dir <= 2'b01;
            default: dir <= 2'b00; 
        endcase

    end
end

endmodule