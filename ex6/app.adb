with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Tic_Tac is
   cpt : Integer := 0;
   
   task Tic;
   task Tac;
   task mutex is
      entry p;
      entry v;
   end mutex;

   task body Tic is
   begin
      loop
         mutex.p;  
         cpt := cpt + 1;
         Put(cpt);
         Put_Line(" tic");
         mutex.v;
         delay 1.0;
      end loop;
   end Tic;

   task body Tac is
   begin
      loop
            mutex.p;
            cpt := cpt + 1;
            Put(cpt);
            Put_Line(" tac");
            mutex.v;
            delay 1.0;
      end loop;
   end Tac;

   task body mutex is
   begin
      loop
         accept p;
         accept v;
      end loop;
   end mutex;
begin
    null;
end Tic_Tac;