(*** Exercice 2 ***)

(* Question 1 *)


type 'a bintree = 
| BinEmpty
| BinNode of 'a * 'a bintree * 'a bintree

let rec bintree_build f h x = 
  if (h<=0)
  then BinEmpty
  else let (x1,x2) = f(x) in 
          BinNode (x,
            (bintree_build f (h-1) x1),
		(bintree_build f (h-1) x2));;

let f x = (2*x, 2*x+1);;

let tru = bintree_build f 2 3;;


(* Question 2 *)

let rec bintree_map t f =
  match t with
    |BinEmpty -> BinEmpty
    |BinNode (bn,l1,l2) -> BinNode (f bn, bintree_map l1 f, bintree_map l2 f);;
(* val bintree_map : 'a bintree -> ('a -> 'b) -> 'b bintree = <fun> *)


(* Question 3 *)

let rec bintree_insert t x =
    match t with
      | BinEmpty -> BinNode(x, BinEmpty, BinEmpty)
      | BinNode (bn, l1, l2) ->
	if bn > x then 
	  BinNode (bn, l1,  bintree_insert l2 x)
	else
	  BinNode (bn, bintree_insert l1 x , l2)

let tree = bintree_insert tru 10;;


(* Question 4 : Persistance *)


(* Question 5 *)

type 'a arbre =
  | ArbreVide
  | Noeud of 'a * 'a arbre list;;

let cons_arbre_vide = ArbreVide;;
let cons_noeud(e,l) = Noeud(e,l);;

let racine a =
  match a with
  | Noeud(e,l) -> e
  | _ -> failwith "erreur";;

let fils a =
  match a with
    | Noeud(e,l) -> l
    | _ -> failwith "erreur";;

(*** test d'utilisation ***)
let t1 = cons_noeud(1,[cons_noeud(2,[cons_noeud(2,[cons_arbre_vide])])]);;
let t2 = cons_noeud(1,[cons_noeud(11,[cons_noeud(111,[cons_arbre_vide]); cons_noeud(112,[cons_arbre_vide])])]);;

let rec tree_build f h t = 
  if (h<=0) then
    cons_arbre_vide
  else
    let Noeud(e,l) = f(t) in 
          cons_noeud (t,
		      [(tree_build f (h-1) t)]);;
