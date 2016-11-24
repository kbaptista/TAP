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


(* Question 4 *)

type zloty =
  | Un
  | Sept
  | Treize;;

let rec glouton n =
  if (n>=13) then
    Treize::(glouton (n-13))
  else if (n>7) then
    Sept::(glouton (n-7))
  else if (n>=1) then
    Un::(glouton (n-1))
  else
    [];;
(* val glouton : int -> zloty list = <fun> *)

glouton 42;;
(* - : zloty list = [Treize; Treize; Treize; Un; Un; Un] *)


(* Question 5 *)

type nombre  =
  | Reel of float
  | Complexe of (float*float) ;;

type solution__trinome =
  | Nb of nombre
  | CoupleReels of (nombre * nombre) 
  | CoupleComplexes of (nombre * nombre) ;;

let abs x = if x > 0. then x else -.x;;

let resolution_trinome (a,b,c) = (* Trinome = ax²+bx+c *)
  let delta = b*.b -. 4.*.a*.c in (* delta = b²-4ac *)
  if (delta > 0.) then
    CoupleReels (Reel ((-.b-.sqrt(delta))/.(2.*.a)), (* sol1 = (-b-sqrt(delta))/2a *)
		 Reel ((-.b+.sqrt(delta))/.(2.*.a))) (* sol2 = (-b+sqrt(delta))/2a *)	 
  else if (delta == 0.) then
    Nb (Reel (-.b/.2./.a)) (* sol = -b/2a *)
  else 
    CoupleComplexes (Complexe ((-.b/.(2.*.a), -.sqrt(abs(delta))/.(2.*.a))), (* sol1 = ( -b/2a, (-i*sqrt(|delta|))/2a *)
		     Complexe ((-.b/.(2.*.a), sqrt(abs(delta))/.(2.*.a))));; (* sol2 = ( -b/2a, (i*sqrt(|delta|))/2a *)
             
(* val resolution_trinome : float * float * float -> solution__trinome = <fun> *)

let rep1 = resolution_trinome (1.,2.,1.);;
(* val rep1 : solution__trinome = Nb (Reel (-1.)) *)

let rep2 = resolution_trinome (3.,2.,-5.);;
(* CoupleReels (Reel (-1.66666666666666674), Reel 1.) *)

let rep3 = resolution_trinome (1.,1.,1.);;
(* val rep3 : solution__trinome =
   CoupleComplexes
   (Complexe (-0.5, -0.866025403784438597),
   Complexe (-0.5, 0.866025403784438597)) *)
(* NB : avec les solutions complexes : il faudrait rajouter 'i' devant la partie imaginaire *)
