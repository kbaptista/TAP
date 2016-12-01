(*** Exercice  2  ***)
 
let f = lazy (failwith "Marchera pas");;
Lazy.force f;;

(*** Question 1 ***)
(* page 9 slides exemples narbel *)
let x1 = lazy( print_endline "Eval" ; 3 + 4);;
Lazy.force x1;;

let x2 = lazy( print_endline "Eval" ; [1,2,3]);;
Lazy.force x2;;
