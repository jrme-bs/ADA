
with text_io;
use text_io;



procedure Buffer3 is


   Taille_Buffer : constant Integer :=4;
   type Buffer_Index is new Integer range 1..Taille_Buffer;
   type Buffer_Type is array (Buffer_Index'range) of Integer;


   protected type Synchronized_Buffer is
      entry Ecrire(Val : in Integer);
      entry Lire(Val : in out Integer);
     private
   	Buffer_Data : Buffer_Type;
   	Index_Cons : Buffer_Index:=Buffer_Index'First;
   	Index_Prod : Buffer_Index:=Buffer_Index'First;
   	Nb_Element : Integer:=0;
   end Synchronized_Buffer;


   protected body Synchronized_Buffer is
      entry Ecrire(Val : in Integer)
      	when Nb_element < Taille_Buffer is
      begin
         Buffer_Data(Index_Prod):=Val;
	 if (Index_Prod=Buffer_Index'Last)
                then Index_Prod:=Buffer_Index'First;
                else Index_Prod:=Index_Prod+1;
         end if;
         Nb_Element:=Nb_Element+1;
      end Ecrire;

      entry Lire(Val : in out Integer)
        when Nb_Element > 0 is
      begin
         Val:=Buffer_Data(Index_Cons);
	 if (Index_Cons=Buffer_Index'Last)
                then Index_Cons:=Buffer_Index'First;
                else Index_Cons:=Index_Cons+1;
         end if;
         Nb_Element:=Nb_Element-1;
      end Lire;
   end Synchronized_Buffer;


   A_Buffer : Synchronized_Buffer;

   task type Producteur;
   task body Producteur is
   Val : Integer := 0;
   begin
      loop
         A_Buffer.Ecrire(Val);
         Put_Line("Production " & Val'Img);
         Val:=Val+1;
      end loop;
   end Producteur;

   task type Consommateur;
   task body Consommateur is
   Val : Integer :=0;
   begin
      loop
         A_Buffer.Lire(Val);
         Put_Line("Consommation " & Val'Img);
      end loop;
   end Consommateur;

   type Producteur_Ptr is access Producteur;
   type Consommateur_Ptr is access Consommateur;


   P : array (1..5) of Producteur_Ptr;
   C : array (1..5) of Consommateur_Ptr;

begin
   for i in 1..5 loop
      P(i):= new Producteur;
      C(i):= new Consommateur;
   end loop;
end Buffer3;


