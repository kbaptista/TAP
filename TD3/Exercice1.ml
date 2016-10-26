(*** Question 1 ***)

let func (x, y, z) = y ;;
func (2, "a", 1.0);;


(*** Question 2 ***)

let plus (x,y) = x+y;;
let fois x y = x*y;;
let curryf f x y = f (x, y) ;;
let decurryf f (x, y)  = f x y;;

let fois_decurryfie = decurryf fois;;
fois_decurryfie (2, 3);;
let plus_curryfie = curryf plus;;
plus_curryfie 2 3;;


(*** Question 3 ***)

let diviser x y = x/y;;
let inverser_argument f x y = f y x;;

let x = diviser 2 3;;
let y = inverser_argument diviser 2 3;;

(* L'intérêt de l'inversion des paramètres est de pouvoir traiter simplement des exceptions survenues juste à cause d'un mauvais placement des paramètres *)


(*** Question 4 ***)

let compose f g = function x -> f (g x);;
(* val compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)
let rec iterate f n = 
  if n = 0 then function x -> x 
  else compose f (iterate f (n - 1));;
(* val iterate : ('a -> 'a) -> int -> 'a -> 'a = <fun> *)

(* exemple qui a servi de démarche pour la construction de la fonction iterate : *)
let add_un x = x+1;;
let un = add_un 0;;
let deux = add_un un;;
let trois = add_un deux;;
let troisBis = add_un (add_un (add_un 0));;
let troisAvecFct f = f (f (f 0));;
(* val valTroisAvecFct : int = 3 *)

let valTroisAvecFct = troisAvecFct add_un;;
(* val valTroisAvecFct : int = 3 *)

let valeurTroisAvecIterate = iterate add_un 3 0;;
(* val valeurTroisAvecIterate : int = 3 *)
