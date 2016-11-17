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

type nb_child_alea =
  | NotFixed of 
  | Fixed of 
