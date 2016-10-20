(*** Exercice  1  ***)

let pi = 3.1415;; (* # val pi : float = 3.1415 *)
let rot_gen pi (x,y,ang) = 
  let newx = x*.cos(ang*.pi) +. y*.sin(ang*.pi) in
  let newy = x*.sin(ang*.pi) -. y*.cos(ang*.pi) in (newx,newy);;
(* val rot_gen : float -> float * float * float -> float * float = <fun> *)
let rot = (rot_gen pi);; (* val rot : float * float * float -> float * float = <fun> *)
let pi = "troispointquatorze";; (* let pi = "troispointquatorze";; *)
rot (1.,0.,1.);;
(* - : float * float = (-0.999999995707656186, 9.26535896604902578e-05) *)


(*** Exercice  2 ***)

(* Les valeurs de retour de la fonction C sont : 1, 3, 423 // cf ex2.c *)

let i = 0;; (* val i : int = 0 *)
let f j = i+j;; (* val f : int -> int = <fun> *)
let i = f 1;; (* val i : int = 1 *)
let i = f 2;; (* val i : int = 2 *)
let i = 421;; (* val i : int = 421 *)
let i = f 2;; (* val i : int = 2 *)
(* Impossible d'avoir le même effet en OCaml car la pureté du langage fait qu'il n'y a pas d'effets de bord. *)

let i = 0;; (* val i : int = 0 *)
let f j = let i = i + j in i;; (* val f : int -> int = <fun> *)
let i = f 1;; (* val i : int = 1 *)
let i = f 2;; (* val i : int = 2 *)
let i = 421;; (* val i : int = 421 *)
let i = f 2;; (* val i : int = 2 *)
(* Et ce, même avec l'expression de la localité de la variable. *)
