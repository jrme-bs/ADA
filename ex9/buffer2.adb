
with Semaphores;
use Semaphores;
with text_io;
use text_io;



procedure Buffer2 is


   Taille_Buffer : constant Integer :=4;
   type Buffer_Index is new Integer range 1..Taille_Buffer;
   type Buffer_Type is array (Buffer_Index'range) of Integer;

   A_Buffer : Buffer_Type;

   Nb_Plein : Semaphore;
   Nb_Vide : Semaphore;
   Mutex_Prod : Semaphore;
   Mutex_Cons : Semaphore;

   Index_Prod : Buffer_Index :=Buffer_Index'First;
   Index_Cons : Buffer_Index :=Buffer_Index'First;


   task type Producteur;
   task body Producteur is
   Val : Integer := 0;
   begin
      loop
         Nb_Vide.P;
	 Mutex_Prod.P;
         A_Buffer(Index_Prod):=Val;
         Put_Line("Production " & Val'Img);
         Nb_Plein.V;
         Val:=Val+1;
         if (Index_Prod=Buffer_Index'Last)
         	then Index_Prod:=Buffer_Index'First;
         	else Index_Prod:=Index_Prod+1;
         end if;
	 Mutex_Prod.V;
      end loop;
   end Producteur;

   task type Consommateur;
   task body Consommateur is
   Val : Integer :=0;
   begin
      loop
         Nb_Plein.P;
	 Mutex_Cons.P;
         Val:=A_Buffer(Index_Cons);
         Put_Line("Consommation " & Val'Img);
         Nb_Vide.V;
         if (Index_Cons=Buffer_Index'Last)
         	then Index_Cons:=Buffer_Index'First;
         	else Index_Cons:=Index_Cons+1;
         end if;
	 Mutex_Cons.V;
      end loop;
   end Consommateur;

   type Producteur_Ptr is access Producteur;
   type Consommateur_Ptr is access Consommateur;

   P : array (1..4) of Producteur_Ptr;
   C : array (1..4) of Consommateur_Ptr;

begin
   Nb_Vide.Init(Taille_Buffer);
   Nb_Plein.Init(0);
   Mutex_Prod.Init(1);
   Mutex_Cons.Init(1);

   for i in 1..4 loop
   	P(i):= new Producteur;
   	C(i):= new Consommateur;
   end loop;

end Buffer2;
