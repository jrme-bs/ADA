generic
   Taille : Positive := 100;  
   type Element is private; 

package Piles is

   Pile_Pleine, Pile_Vide : exception;


   procedure Vider; 
   function Est_Vide return Boolean; 
   function Sommet return Element; 
   procedure Empiler (
         V : in     Element ); 
   procedure Depiler; 

private

   type Table is array (1 .. Taille) of Element; 

   Nb : Natural := 0;
   Donnees : Table;

end Piles;
