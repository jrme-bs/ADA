

package body Semaphores is


   protected body Semaphore is

      entry P when Value > 0 is 
      begin
         Value:=Value-1;
      end P;

      procedure V is 
      begin
         Value:=Value+1;
      end V;

      procedure Init (
            Val : Natural ) is 
      begin
         Value:=Val;
      end Init;

   end Semaphore;


end Semaphores;



