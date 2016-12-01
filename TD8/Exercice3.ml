(*** Exercice  3  ***)
 
type 'a stm1 = 
| Stm1Empty 
| Cons1 of 'a * ('a stm1 lazy_t)
 
let rec length_evaluated stm = match stm with 
  | Stm1Empty -> 0
  | Cons1(x,y)   -> if not(Lazy.lazy_is_val y)
                    then 1
                    else let u = Lazy.force y in 
                         1 + length_evaluated u;;

let stm1val = Cons1(Cons1 ) (* in progress *)

let stm1_head l =
  match l with
    | Stm1Empty ->failwith "empty"
    | Cons1(a, lazy t)-> a;;
	

type 'a stm2 = 
| Stm2Empty 
| Cons2 of ('a * 'a stm2) lazy_t
