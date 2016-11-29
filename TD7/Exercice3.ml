(***** Exercice 3 *****)

type 'a set = Set of ('a -> bool);;


(* Question 1 *)

let set_empty = Set (fun x -> false);;
let set_full = Set (fun x -> true);;
let singleton x = Set (fun y -> x=y);;


(* Question 2 *)

let set_mem (Set s) x =  s x;;

  
(* Question 3 *)

let set_add (Set s) elem = Set (fun y->elem=y || s y);;
let set_out (Set s) = Set (fun y-> not (s y));;

(* Question 4 *)

let set_even = Set (fun x -> (x mod 2) == 0);;
let set_contains_0 (Set s) = s 0;;  (* pattern-matching *)
 
let ( +| ) (Set s1) (Set s2) = Set (fun y -> s1 y || s2 y);; (* union *)
let ( *| ) (Set s1) (Set s2) = Set (fun y -> s1 y && s2 y);; (* intersection *)

let ( +-| ) s1 s2 = (s1 *| (set_out s2)) +| ((set_out s1) *| s2);; (* différence symétrique *)

let xor a b = (a & (not b)) or ((not a) & b);;

let (+-|) s1 s2 = Set ();;
