generic
  type Element is private;
  with procedure put(e : in Element);
  with function  add(e1 : in Element; e2 : in Element) return Element;


package arbre is 

  type cellule;
  type cellule_ptr is access cellule;

  type cellule is record
    information : Element;
    gauche  : cellule_ptr;
    droit   : cellule_ptr;
  end record;

  procedure ajouter_gauche(e : in Element ; pere : in cellule_ptr; noeud : out cellule_ptr);
  procedure ajouter_droit(e : in Element ; pere : in cellule_ptr; noeud : out cellule_ptr);
  procedure Put(noeud : in cellule_ptr);
  function somme (noeud : in cellule_ptr) return Element;

end arbre;


