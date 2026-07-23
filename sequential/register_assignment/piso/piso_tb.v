module piso_tb;
parameter N = 4 ;
reg rst;
reg clk_rx,clk_tx;
reg [N-1:0]data_in;
reg valid_in,ready_out;
wire data_out,valid_out,ready_in;

reg [N-1:0]checker;

integer i=N-1;

piso dut(.rst(rst),.clk_rx(clk_rx),.clk_tx(clk_tx),.data_in(data_in),.valid_in(valid_in),.ready_out(ready_out),
.data_out(data_out),.valid_out(valid_out),.ready_in(ready_in));


always #(N) clk_rx = ~clk_rx;
always #(N/2) clk_tx = ~clk_tx;

task reset;
begin
    rst=1;data_in=0;
    @(posedge clk_rx);#1;
    rst=0;
end
endtask



task parallel_load;
input [N-1:0]parallel_in;
begin
    data_in = parallel_in;valid_in=1;
    checker = parallel_in;
    @(posedge clk_rx);#1;
    valid_in=0;
end
endtask


task serial_out;

begin
    ready_out=1;

    repeat(N) begin 
     @(posedge clk_tx or negedge clk_tx); #1; 


    end
    ready_out=0;

end
endtask


initial begin
    clk_rx=0;
    clk_tx=0;
    rst=1;
    valid_in=0;
    ready_out=0;
    data_in=0;

    $dumpfile("piso.vcd");
    $dumpvars(0,piso_tb);

    

    reset();
    parallel_load(4'b1101);
    serial_out();

   
    $finish;

end

always @(clk_tx) begin
    if(ready_out)begin
        if(checker[i] != data_out)begin $display("error"); end
        else begin $display("fine"); end
         i=i-1;
    end
    
    
end
endmodule