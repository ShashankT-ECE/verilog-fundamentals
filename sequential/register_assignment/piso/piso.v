module piso #(parameter N = 4)(
    input rst,
    input clk_rx,clk_tx,
    input [N-1:0]data_in,
    input valid_in,ready_out,

    output reg data_out,
    output reg valid_out,ready_in
);

reg [N-1:0]temp;

always@(posedge clk_rx)begin
    if(rst)begin
    temp <= 0; data_out <= 0;ready_in=1;end

    else if(valid_in && ready_in)
    temp <= data_in;
    
    else
    temp <= temp;
end

always@(posedge clk_tx or negedge clk_tx)begin
    if(rst)begin
     data_out <= 0;valid_out=1;end

    else if(ready_out && valid_out)
    begin
        data_out <= temp[N-1];
        temp <= temp <<1;
    end

    else
    data_out <= data_out;

end
endmodule

