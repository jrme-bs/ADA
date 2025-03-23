with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure calculatrice is

task type memoire is 
        entry ajouter(num : in integer);
        entry soustraire(num : in integer);
        entry consulter(num : out integer);
end memoire;

task body memoire is
    mem : Integer := 0;
begin
    loop
        select
            accept ajouter(num : in integer) do
                mem := mem + num;
            end ajouter;
        or
            accept soustraire(num : in integer) do
                mem := mem - num;
            end soustraire;
        or
            accept consulter(num : out integer) do
                num := mem;
            end consulter;
        end select;
    end loop;
end memoire;

    result : integer;
    M1 : memoire;
begin
    M1.ajouter(10);
    M1.soustraire(4);
    M1.ajouter(10);
    M1.consulter(result);
    Put_Line(integer'Image(result));

end calculatrice;