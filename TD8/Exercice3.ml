(*** Exercice  3  ***)
 
type 'a stm1 = 
| Stm1Empty 
| Cons1 of 'a * ('a stm1 lazy_t)
 
let rec length_evaluated stm =
  match stm with 
  | Stm1Empty -> 0
  | Cons1(x,y)   -> if not(Lazy.is_val y)
                    then 1
                    else let u = Lazy.force y in 
                         1 + length_evaluated u;;

(*** Question 1 ***)

let stream = Cons1 (1, lazy (Cons1 (1/0, lazy(Stm1Empty))));;
(* Cette définition pose problème car les exceptions ne seront trouvées et soulevées qu'à la sortie du flot et non en amont, avant son utilisation. *)


(*** Question 2 ***)

let stm1_head s =
  match s with
    | Stm1Empty -> failwith "empty"
    | Cons1(first, _) -> first;;
	
let rec stm1_tail s =
  match s with
    | Stm1Empty -> failwith "empty"
    | Cons1(_, next) -> next;;

stm1_head stream;; (*- : int = 1*)
stm1_tail stream;; (*- : int stm1 lazy_t = <lazy>*)



type 'a stm2 = 
| Stm2Empty 
| Cons2 of ('a * 'a stm2) lazy_t



(*** Question 3 ***)

let rec list_to_stream l =
  match l with
    | [] -> Stm2Empty
    | t::q -> Cons2 (lazy (t, list_to_stream q));;

list_to_stream [1;2;3;4];; (*- : int stm2 = Cons2 <lazy>*)



(*** Question 4 ***)

let rec fun_to_stream_bounded f s size = 
  if size=0 then
    Stm2Empty
  else
    Cons2 (lazy (s, fun_to_stream_bounded f (f s) (size-1)));;

fun_to_stream_bounded (fun elem -> elem+1) (list_to_stream [1;2;3;4]) 4;; (* ne fonctionne pas *)
let test_stream_bounded (fun elem -> Cons2 ( lazy (Lazy.force (fst elem) + 1, (snd elem))) 1 4;; (* ne fonctionne pas non plus *)


(*** Question 5 ***)


(*** Question 6 ***)

let rec stm_map s f =
  match s with
  | Stm2Empty -> Stm2Empty
  | Cons2 (lazy (x,y)) -> Cons2 (lazy (f x, stm_map y f));;

let test_map = stm_map (list_to_stream [1;2;3;4]) (fun x -> x+1);; (* val test_map : int stm2 = Cons2 <lazy> *)

(*** Question 7 ***)

let rec stm_compose s1 s2 fCompo =
  match (s1,s2) with 
  | ( Stm2Empty, Stm2Empty ) -> Stm2Empty
  | ( Cons2 (lazy (x1,y1)), Cons2 (lazy (x2,y2)) ) -> Cons2 ( lazy (((fCompo x1 x2),(stm_compose y1 y2 fCompo))) )
  | ( Cons2 (lazy (x,y)), Stm2Empty ) -> failwith "different size of streams : s1 bigger than s2"
  | ( Stm2Empty, Cons2 (lazy (x,y)) ) -> failwith "different size of streams : s2 bigger than s1";;


(*** Question 8 ***)

let rec stm_concat s1 s2 =
  match s1 with
    | Stm2Empty -> s2
    | Cons2 (lazy (x,y)) -> Cons2 (lazy (x, stm_concat y s2));;
 
let test_concat = stm_concat (list_to_stream [1;2;3;4]) (list_to_stream [5;6;7;8]);; (* val test_concat : int stm2 = Cons2 <lazy> *)



let rec stm_print s =
  match s with
    | Stm2Empty -> print_endline ""
    | Cons2 (lazy (x,y)) ->
      begin
	print_int x ;
	print_string ";";
	stm_print y
      end;;

stm_print ( test_stream_bounded );;
stm_print ( test_map );; (* 2;3;4;5; *)
stm_print ( test_concat );; (* 1;2;3;4;5;6;7;8; *)
