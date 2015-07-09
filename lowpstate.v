module lplfsr(ff,clk,reset,out);
  input clk,reset;
  output ff,out;
  wire reset,clk;
  reg [7:0]ff,r,a,o,out;
  reg[1:0] state;
  parameter state0= 2'b00,state1= 2'b01,state2= 2'b10,state3= 2'b11;
  reg tempff,temp;
  always@(posedge clk)
  begin
    if(reset)
    begin
      ff = 8'b01001011;
      state = state0;
    end
    else
      case(state)
        state0:
            begin
              
            temp = ff[7];
            ff[7] = (temp^ff[0]);
            tempff = ff[4];
            ff[4] = ff[5];
            ff[5] = ff[6];
            ff[6] = temp;
            a[7] = ff[7]&(ff[0]^ff[7]);
            o[7] = ff[7]|(ff[0]^ff[7]);
            a[6] = ff[7]&ff[6];
            o[6] = ff[7]|ff[6];
            a[5] = ff[6]&ff[5];
            o[5] = ff[6]|ff[5];
            a[4] = ff[4]&ff[5];
            o[4] = ff[4]|ff[5];
            a[3] = ff[3]&tempff;
            o[3] = ff[3]|tempff;
            a[2] = ff[2]&ff[3];
            o[2] = ff[2]|ff[3];
            a[1] = ff[1]&ff[2];
            o[1] = ff[1]|ff[2];
            a[0] = ff[0]&ff[1];
            o[0] = ff[0]|ff[1];
            if(ff[0]==1)
            begin
              r[7] = o[7];
              r[6] = o[6];
              r[5] = o[5];
              r[4] = o[4];
              r[3] = o[3];
              r[2] = o[2];
              r[1] = o[1];
              r[0] = o[0];
            end
            if(ff[0]==0)
            begin
              r[7] = a[7];
              r[6] = a[6];
              r[5] = a[5];
              r[4] = a[4];
              r[3] = a[3];
              r[2] = a[2];
              r[1] = a[1];
              r[0] = a[0];
            end
            out = ff;
            state = state1;
           end
        state1:
            begin
              
            a[7] = ff[7]&(ff[0]^ff[7]);
            o[7] = ff[7]|(ff[0]^ff[7]);
            a[6] = ff[7]&ff[6];
            o[6] = ff[7]|ff[6];
            a[5] = ff[6]&ff[5];
            o[5] = ff[6]|ff[5];
            a[4] = ff[4]&ff[5];
            o[4] = ff[4]|ff[5];
            a[3] = ff[3]&tempff;
            o[3] = ff[3]|tempff;
            a[2] = ff[2]&ff[3];
            o[2] = ff[2]|ff[3];
            a[1] = ff[1]&ff[2];
            o[1] = ff[1]|ff[2];
            a[0] = ff[0]&ff[1];
            o[0] = ff[0]|ff[1];
            if(ff[0]==1)
            begin
              r[7] = o[7];
              r[6] = o[6];
              r[5] = o[5];
              r[4] = o[4];
              r[3] = o[3];
              r[2] = o[2];
              r[1] = o[1];
              r[0] = o[0];
            end
            if(ff[0]==0)
            begin
              r[7] = a[7];
              r[6] = a[6];
              r[5] = a[5];
              r[4] = a[4];
              r[3] = a[3];
              r[2] = a[2];
              r[1] = a[1];
              r[0] = a[0]; 
            end
            out[7] = ff[7]; 
            out[6] = ff[6];
            out[5] = ff[5];
            out[4] = ff[4];
            out[3] = r[3];
            out[2] = r[2];
            out[1] = r[1];
            out[0] = r[0];
            state = state2;
            end
          state2:
           begin
             
            ff[0] = ff[1];
            ff[1] = ff[2];
            ff[2] = ff[3];
            ff[3] = tempff;
            a[7] = ff[7]&(ff[0]^ff[7]);
            o[7] = ff[7]|(ff[0]^ff[7]);
            a[6] = ff[7]&ff[6];
            o[6] = ff[7]|ff[6];
            a[5] = ff[6]&ff[5];
            o[5] = ff[6]|ff[5];
            a[4] = ff[4]&ff[5];
            o[4] = ff[4]|ff[5];
            a[3] = ff[3]&tempff;
            o[3] = ff[3]|tempff;
            a[2] = ff[2]&ff[3];
            o[2] = ff[2]|ff[3];
            a[1] = ff[1]&ff[2];
            o[1] = ff[1]|ff[2];
            a[0] = ff[0]&ff[1];
            o[0] = ff[0]|ff[1];
            if(ff[0]==1)
            begin
              r[7] = o[7];
              r[6] = o[6];
              r[5] = o[5];
              r[4] = o[4];
              r[3] = o[3];
              r[2] = o[2];
              r[1] = o[1];
              r[0] = o[0];
            end
            if(ff[0]==0)
            begin
              r[7] = a[7];
              r[6] = a[6];
              r[5] = a[5];
              r[4] = a[4];
              r[3] = a[3];
              r[2] = a[2];
              r[1] = a[1];
              r[0] = a[0]; 
            end
            out = ff;
            state = state3;
          end
        state3:
             begin
               
            a[7] = ff[7]&(ff[0]^ff[7]);
            o[7] = ff[7]|(ff[0]^ff[7]);
            a[6] = ff[7]&ff[6];
            o[6] = ff[7]|ff[6];
            a[5] = ff[6]&ff[5];
            o[5] = ff[6]|ff[5];
            a[4] = ff[4]&ff[5];
            o[4] = ff[4]|ff[5];
            a[3] = ff[3]&tempff;
            o[3] = ff[3]|tempff;
            a[2] = ff[2]&ff[3];
            o[2] = ff[2]|ff[3];
            a[1] = ff[1]&ff[2];
            o[1] = ff[1]|ff[2];
            a[0] = ff[0]&ff[1];
            o[0] = ff[0]|ff[1];
            if(ff[0]==1)
            begin
              r[7] = o[7];
              r[6] = o[6];
              r[5] = o[5];
              r[4] = o[4];
              r[3] = o[3];
              r[2] = o[2];
              r[1] = o[1];
              r[0] = o[0];
            end
            if(ff[0]==0)
            begin
              r[7] = a[7];
              r[6] = a[6];
              r[5] = a[5];
              r[4] = a[4];
              r[3] = a[3];
              r[2] = a[2];
              r[1] = a[1];
              r[0] = a[0]; 
            end
            out[7] = r[7]; 
            out[6] = r[6];
            out[5] = r[5];
            out[4] = r[4];
            out[3] = ff[3];
            out[2] = ff[2];
            out[1] = ff[1];
            out[0] = ff[0];
            state = state0;
            end
      endcase
  end
endmodule
module lplfsrst_tb;
reg reset,clk;
wire [7:0]ff,out;
lplfsr linst(ff,clk,reset,out);
initial
begin
  reset = 1'b1;
  clk = 1'b1;
  #10 reset = 1'b0;
end 
always
#5 clk = ~clk;
endmodule
