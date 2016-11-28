(***** Exercice 3 *****)

type 'a set = Set of ('a -> bool);;


(* Question 1 *)

let set_empty = Set (fun x -> false);;
let set_full = Set (fun x -> true);;
let singleton x = Set (fun y -> x=y);;


(* Question 2 *)

let set_mem (Set s) x =  s x;

  
(* Question 3 *)


(* Question 4 *)

let set_even = Set (fun x -> (x mod 2) == 0);;
let set_contains_0 (Set s) = s 0;;  (* pattern-matching *)
 
let ( +| ) (Set s1) (Set s2) = Set (fun y -> s1 y || s2 y);;  
let ( *| ) (Set s1) (Set s2) = Set (fun y -> s1 y && s2 y);; 
