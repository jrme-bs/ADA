package Angles is
   type angle_degre is new Integer range 0 .. 360;
   type angle_radian is new Float range 0.0 .. 2.0 * 3.1456;

   procedure Get_degre (A : out angle_degre);
   procedure Put_degre (A : in angle_degre);
   procedure Get_radian (A : out angle_radian);
   procedure Put_radian (A : in angle_radian);
end Angles;
