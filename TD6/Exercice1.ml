(*** Exercice  1  ***)
 

(* Question 1 *)

type weight =
  | Kilogrammes of float
  | Livres of float
  | Carats of float;;
(* type weight = Kilogrammes of float | Livres of float | Carats of float *)

(* Question 2 *)

let convert x =
  match x with
    | Kilogrammes x -> x
    | Livres x -> x/.2.205
    | Carats x -> x/.5000.0;;
(* val convert : weight -> float = <fun> *)

let w = convert (Carats 2.);;

(* Question 3 *)
type value = 
  | Int of int 
  | Float of float;;
 
let string_of_value x =
 match x with 
  | Int i   -> string_of_int i;
  | Float f -> string_of_float f;;
 
let rec sum_of_values a b = match (a,b) with 
  | (Int i, Int j)     -> Int(i+j)
  | (Int i, Float f)   -> Float((float i)+.f)
  | (Float f, Int i)  -> Float((float i)+.f)
  | (Float f, Float g) -> Float (f+.g);;

