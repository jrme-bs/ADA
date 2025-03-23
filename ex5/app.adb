with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Tic_Tac is
   cpt : Integer := 0;
   
   task Tic;
   task Tac is
      entry SynchTAC;
   end Tac;

   task body Tic is
   begin
      loop
         cpt := cpt + 1;
         
         Put(cpt);
         Put_Line(" tic");
         
         delay 1.0;
         Tac.SynchTAC;
      end loop;
   end Tic;

   task body Tac is
   begin
      loop
         accept SynchTAC do
            cpt := cpt + 1;
            
            Put(cpt);
            Put_Line(" tac");
            delay 1.0;

         end SynchTAC;
      end loop;
   end Tac;

begin
    null;
end Tic_Tac;