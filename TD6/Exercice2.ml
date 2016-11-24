(**** Exercice 2 ****)

(*** Question 1 ***)

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
(* val tru : int bintree =
   BinNode (3, BinNode (6, BinEmpty, BinEmpty),
   BinNode (7, BinEmpty, BinEmpty)) *)


(*** Question 2 ***)

let rec bintree_map t f =
  match t with
    |BinEmpty -> BinEmpty
    |BinNode (bn,l1,l2) -> BinNode (f bn, bintree_map l1 f, bintree_map l2 f);;
(* val bintree_map : 'a bintree -> ('a -> 'b) -> 'b bintree = <fun> *)


(*** Question 3 ***)

let rec bintree_insert t x =
    match t with
      | BinEmpty -> BinNode(x, BinEmpty, BinEmpty)
      | BinNode (bn, l1, l2) ->
	if bn > x then 
	  BinNode (bn, l1,  bintree_insert l2 x)
	else
	  BinNode (bn, bintree_insert l1 x , l2)
(* val bintree_insert : 'a bintree -> 'a -> 'a bintree = <fun> *)

let truc = bintree_insert tru 10;;
(* val truc : int bintree =
   BinNode (3, BinNode (6, BinNode (10, BinEmpty, BinEmpty), BinEmpty),
   BinNode (7, BinEmpty, BinEmpty)) *)

let truc2 = bintree_insert tru 2;;
(* val truc2 : int bintree =
   BinNode (3, BinNode (6, BinEmpty, BinEmpty),
   BinNode (7, BinEmpty, BinNode (2, BinEmpty, BinEmpty))) *)


(*** Question 4 : Persistance ***)
tru;;
(* 
- : int bintree =
   BinNode (3, BinNode (6, BinEmpty, BinEmpty), BinNode (7, BinEmpty, BinEmpty)) 
*)

(* tru reste l'arbre initial, tel qu'il a été créé. *)
(* La persistance de cet objet peut être expliqué par le fait que la 
   fonction bintree_insert ne manipule que les valeurs des objets manipulés
   et non leurs adresses/références *)
(* Ceci est possible car le langage OCaml garanti que les valeurs sont 
   immuables et que les fonctions créent et retournent de nouvelles valeurs *)


(*** Question 5 : tree_build ***)

type 'a arbre =
  | ArbreVide
  | Noeud of 'a * 'a arbre list;;


let tree_build(value,l) = Noeud(value,l);;

let t1 = tree_build(1,
		    [ tree_build(2,
				[ tree_build(2,
					    [ ArbreVide ])])]);;
let t2 = tree_build(1,
		    [ tree_build(11,
				 [ tree_build(111,
					      [ ArbreVide ]);
				   tree_build(112,
					      [ ArbreVide ])
				 ])
		    ]);;


(*** Question 6 : tree_map ***)

let rec tree_map f t = match t with
    (Noeud(a,l)) -> Noeud(f a, List.map (tree_map f) l)
  | ArbreVide -> ArbreVide;;

let f x = 2*x;;

let t3 = tree_map f t2;;


(*** Question 7 : tree_map recursif terminal ***)

let rec tree_map_rec_terminal f t = match t with
    (Noeud(a,l)) -> Noeud(f a, List.rev_map (tree_map_rec_terminal f) l)
  | ArbreVide -> ArbreVide;;

let f x = 4*x;;

let t4 = tree_map f t2;;
