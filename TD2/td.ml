(*** Exercice  1  ***)

let pi = 3.1415;;
let rot_gen pi (x,y,ang) = 
  let newx = x*.cos(ang*.pi) +. y*.sin(ang*.pi) in
  let newy = x*.sin(ang*.pi) -. y*.cos(ang*.pi) in (newx,newy);;
let rot = (rot_gen pi);;
let pi = "troispointquatorze";;
rot (1.,0.,1.);;
(* - : float * float = (-0.999999995707656186, 9.26535896604902578e-05) *)

(*** Exercice  2 ***)


(* valeurs de retour 1, 3, 423 *)

let i = 0;;
let f j =
  i+j;;

let i = f 1;;
let i = f 2;;
let i = 421;;
let i = f 2;;

(* impossible d'avoir le même effet => fonction pure*)
