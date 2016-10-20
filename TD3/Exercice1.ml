
(*** question 1 ***)
let func (x, y, z) = y ;;
func (2, "a", 1.0);;

(*** question 2 ***)
let plus (x,y) = x+y;;
let fois x y = x*y;;
let curryf f x y = f (x, y) ;;
let decurryf f (x, y)  = f x y;;

let fois_decurryfie = decurryf fois;;
fois_decurryfie (2, 3);;
let plus_curryfie = curryf plus;;
plus_curryfie 2 3;;


(*** question 3 ***)
let diviser x y = x/y;;
let inverser_argument f x y = f y x;;

let x = diviser 2 3;;
let y = inverser_argument diviser 2 3;;

(* intzeret : attendre un des arguments qui serait passé *)

(*** question 4 ***)
