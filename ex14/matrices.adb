with text_io; use text_io;
package body matrices is 

function "*" (X : in Element; M : in Matrice) return Matrice is 
result : Matrice := M;

Mat : Matrice (M'first(1) .. M'last(1), M'first(2) .. M'last(2));

begin
    for i in M'first(1) .. M'last(1) loop
        for j in M'first(2) .. M'last(2) loop
            Mat(i, j) := M(i, j)*X;
        end loop;
    end loop;
return M;
end "*";

function "*" (M : in Matrice; X : in Element) return Matrice is 
result : Matrice := M;

Mat : Matrice (M'first(1) .. M'last(1), M'first(2) .. M'last(2));

begin
    Mat := "*"(X, M);
return Mat;
end "*";

function "*" (X : in Matrice; Y : in Matrice) return Matrice is 
result : Matrice := X;
    
Mat : Matrice (X'First(1) .. X'Last(1), Y'First(2) .. Y'Last(2));

begin

for i in X'range(1) loop
	for j in Y'range(2) loop
      for k in X'range(2) loop
		   Mat(i,j) := X(i,k)*Y(k,j);
      end loop;
	end loop;
end loop;

return Mat;
end "*";

procedure Put(M : in Matrice) is 
begin
    for i in M'first(1) .. M'last(1) loop
        for j in M'first(2) .. M'last(2) loop
            Put(M(i, j));
        end loop;
    end loop;
end Put;


end matrices;