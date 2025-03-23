with angles; use angles;
with Text_IO; use Text_IO;

procedure Lire is 
   A : angle_degre;
   B : angle_radian;
   
begin
   Put("saisir un angle degre : ");
   angles.Get_degre(A);
   angles.Put_degre(A);

   Put("saisir un angle radian : ");
   angles.Get_radian(B);
   angles.Put_radian(B);
end Lire;