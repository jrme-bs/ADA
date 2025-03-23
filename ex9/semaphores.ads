
package Semaphores is



   protected type Semaphore is
      entry P; 
      procedure V; 
      procedure Init (
            Val : Natural ); 

   private
      Value : Natural:=1;
   end Semaphore;


end Semaphores;

