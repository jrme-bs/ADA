
with Semaphores;
use Semaphores;
with text_io;
use text_io;



procedure Buffer1 is


   Taille_Buffer : constant Integer :=4;
   type Buffer_Index is new Integer range 1..Taille_Buffer;
   type Buffer_Type is array (Buffer_Index'range) of Integer;

   A_Buffer : Buffer_Type;

   Nb_Plein : Semaphore;
   Nb_Vide : Semaphore;

   task type Producteur;
   task body Producteur is
   Val : Integer := 0;
   Index_Prod : Buffer_Index :=Buffer_Index'First;
   begin
      loop
         Nb_Vide.P;
         A_Buffer(Index_Prod):=Val;
         Put_Line("Production " & Val'Img);
         Nb_Plein.V;
         Val:=Val+1;
         if (Index_Prod=Buffer_Index'Last)
         	then Index_Prod:=Buffer_Index'First;
         	else Index_Prod:=Index_Prod+1;
         end if;
      end loop;
   end Producteur;

   task type Consommateur;
   task body Consommateur is
   Val : Integer :=0;
   Index_Cons : Buffer_Index :=Buffer_Index'First;
   begin
      loop
         Nb_Plein.P;
         Val:=A_Buffer(Index_Cons);
         Put_Line("Consommation " & Val'Img);
         Nb_Vide.V;
         if (Index_Cons=Buffer_Index'Last)
         	then Index_Cons:=Buffer_Index'First;
         	else Index_Cons:=Index_Cons+1;
         end if;
      end loop;
   end Consommateur;

   type Producteur_Ptr is access Producteur;
   type Consommateur_Ptr is access Consommateur;

   P1 : Producteur_Ptr;
   C1 : Consommateur_Ptr;

begin
   Nb_Vide.Init(Taille_Buffer);
   Nb_Plein.Init(0);

   P1:= new Producteur;
   C1:= new Consommateur;

end Buffer1;
