with Text_IO; use Text_IO;

package body angles is

   package angle_degre_io is new Integer_IO(angle_degre);
   package angle_radian_io is new Float_IO(angle_radian);

   procedure Get_degre(A : out angle_degre) is
   begin
      declare
         angle : angle_degre;
      begin
         angle_degre_io.Get(angle);
         A := angle_degre(angle);
      end;
   end Get_degre;

   procedure Put_degre(A : in angle_degre) is
   begin
      angle_degre_io.Put(A);
   end Put_degre;

   procedure Get_radian(A : out angle_radian) is
   begin
      declare
         angle : angle_radian;
      begin
         angle_radian_io.Get(angle);
         A := angle_radian(angle);
      end;
   end Get_radian;

   procedure Put_radian(A : in angle_radian) is
   begin
      angle_radian_io.Put(A);
   end Put_radian;

end angles;
