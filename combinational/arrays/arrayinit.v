module arrayinit;
    integer arr[9:0];
    integer i;

    initial begin
        for(i=0;i<10;i=i+1)begin
            arr[i]=$urandom_range(10,90);
            $display("i=%d,arr[i]=%d",i,arr[i]);
        end
    end
    endmodule
