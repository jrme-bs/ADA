
with Semaphores;
use Semaphores;
with text_io;
use text_io;


procedure Section_Critique is

   Mutex : Semaphore;

   task type Une;
   task body Une is
   begin
      loop
         Mutex.P;
         Put_Line("en section critique !!");
         Mutex.V;
      end loop;
   end Une;


   type Une_Ptr is access Une;

   Plusieurs : array (1..10) of Une_Ptr;

begin
   Mutex.Init(1);
   for i in 1..10 loop
   	Plusieurs(i):= new Une;
   end loop;
end Section_Critique;


