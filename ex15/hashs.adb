
with Text_Io;
use Text_Io;



package body Hashs is



   procedure Put (
         H : in     Hash ) is 

      Current : Link;  

   begin
      for I in Hash'range loop
         Current:=H(I);
         while Current/=null loop
            Put("Key  = ");
            Put(Current.A_Key);
            New_Line;
            Put("   Data = ");
            Put(Current.A_Data);
            New_Line;

            Current:=Current.Next;
         end loop;
      end loop;
   end Put;


   procedure Initialize (
         H : in out Hash ) is 
   begin
      for I in Hash'range loop
         H(I):=null;
      end loop;
   end Initialize;


   procedure Add (
         H     : in out Hash;             
         Key   : in     Key_Type; 
         Data  : in     Data_Type         ) is 

      Item : Natural := Compute_Hash (Key);  
      C    : Link;  

   begin
      if H(Item)/=null then
         C := new Cell;
         C.A_Data:=Data;
         C.A_Key:=Key;
         C.Next:=H(Item).Next;
         H(Item).Next:=C;
      else
         H(Item):= new Cell;
         H(Item).A_Data:=Data;
         H(Item).A_Key:=Key;
      end if;
   end Add;


   function Consult (
         H     : in     Hash;            
         Key   : in     Key_Type) 
     return Data_Type is 

      Item    : Natural := Compute_Hash (Key);  
      Current : Link    := H (Item);  

   begin

      while Current/=null loop
         if Current.A_Key = Key
               then
            return Current.A_Data;
         end if;
         Current:=Current.Next;
      end loop;

      raise Data_Not_Found;

   end Consult;


end Hashs;


