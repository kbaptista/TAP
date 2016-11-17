(*** Exercice  4  ***)

(* Question 1 *)

type 'a queue = Q of 'a list * 'a list;;    

let q_insert x (Q(l1,l2)) = Q([x]@l1,l2);;

let q2 = (Q([], []));;

let q3 = q_insert 1 q2;;
let q4 = q_insert 2 q3;;


(* Question 2 *)

let q_fun  (Q (l1, l2)) = l1@l2;;
let q = q_fun (Q([], []));;

let q_transfer (Q(l1,l2)) =
  if(List.length l2)=0 then
    Q([], List.rev l1)
  else
    Q(l1,l2);;

let q5 = q_transfer q4 ;;
let q6 = q_transfer q2 ;;

(* Question 3 *)

let rec q_pop (Q(l1,l2)) =
  if(List.length l2)=0 then
    if(List.length l1)=0 then
      failwith "queue vide"
    else
      q_pop (q_transfer (Q(l1, l2)))
  else
    Q([], (List.tl l2));;

  
let q7 = q_pop q4;;
