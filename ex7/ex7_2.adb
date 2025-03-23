with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ex7_2 is

    task type element;

    task body element is 
    begin
        loop
            Put_Line("Une tache...");
            delay 1.0;
        end loop;
    end element;

    type element_ptr is access element;
    
    Taches : array (1 .. 10) of element_ptr;
begin
    for i in 1 .. 10 loop
        Taches(i):=new element;
    end loop;
end ex7_2;