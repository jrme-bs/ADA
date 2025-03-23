with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ex7 is

    task type element;

    task body element is 
    begin
        loop
            Put_Line("Une tache...");
            delay 1.0;
        end loop;
    end element;
    
    Taches : array (1 .. 10) of element;
begin
    null;
end ex7;