class generator;
  
  rand bit [3:0] addr;
  rand bit wr;
  
  constraint value{
    if(wr)
    {
      addr inside {[0:7]};        
    }
    else
    {
      addr inside {[8:15]};
    }

                 }

endclass
 
module tb;

  generator g;

  initial begin
    g = new();

    for(int i=0;i<20;i++) begin
      assert(g.randomize()) else $display("Randomization Failed");

      $display("Vaue of wr: %0d | Value of addr: %0d",g.wr,g.addr);
    end
  end


endmodule
