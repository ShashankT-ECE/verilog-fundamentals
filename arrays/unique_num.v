module unique_num;
    integer arr[9:0];
    integer i,j,value;
    reg exit_flag;

    initial begin
        i=0;
        while(i<10)begin
            value = $urandom_range(50,60);
            exit_flag=0;
            for(j=0;j<i;j=j+1) begin
                if(value==arr[j])begin exit_flag=1;j=i; end
            end
            if(exit_flag==0)begin arr[i]=value;i=i+1; end

        end
        for(i=0;i<10;i=i+1) begin $display("arr[%d] = %d",i,arr[i]); end
    end
    endmodule
