with text_io;
use text_io;

package body arbre is 


procedure ajouter_droit(e : in Element ; pere : in cellule_ptr; noeud : out cellule_ptr) is 
begin
	noeud := new cellule;
	noeud.information:=e;
	if (pere /= null)
		then pere.droit:=noeud;
	end if;
end ajouter_droit;


procedure ajouter_gauche(e : in Element ; pere : in cellule_ptr; noeud : out cellule_ptr) is 
begin
	noeud := new cellule;
	noeud.information:=e;
	if (pere /= null)
		then pere.gauche:=noeud;
	end if;
end ajouter_gauche;

procedure put(noeud : in cellule_ptr) is 
begin
	put(noeud.information);
	if (noeud.gauche /= null)
		then put(noeud.gauche);
	end if;
	if (noeud.droit /= null)
		then put(noeud.droit);
	end if;
end Put;


function somme (noeud : in cellule_ptr) return Element is
result : Element := noeud.information;
begin
	if (noeud.gauche /= null)
		then result:=add(result,somme(noeud.gauche));
	end if;
	if (noeud.droit /= null)
		then result:=add(result,somme(noeud.droit));
	end if;
	return result;
end somme;


end arbre;


