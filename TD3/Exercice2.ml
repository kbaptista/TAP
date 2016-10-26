(*** Question 1 ***)

[];; (* # - : 'a list = [] , généricité et atomicité du module List *)
2::1::[];; (* - : int list =  [2; 1] , détermination du type des valeurs car en OCaml les listes sont homogènes *)
[1; 2];; (* - : int list = [1; 2] *)
[(1, "truc");(2,"bidule")];;
(* couples composés d'une clef de type int et d'une valeur de type string : 
   (int * string) list = [(1, "truc"); (2, "bidule")] *)

let rec voir l =
  match l with
    | [] -> ()
    | t::q -> print_int t; print_string " "; voir q;;
(* val voir : int list -> unit = <fun> *)

let maListe = [1;2;3];; (* val maListe : int list = [1; 2; 3] *)
voir maListe;; (* 1 2 3 - : unit = () *)


(*** Question 2 ***)

let rec list_remove list key =
  let getKey (a,b)=a in
  match list with
    | []->[]
    | t::q->if(getKey(t)=key) then
	list_remove q key else
	t::list_remove q key;;
(* val list_remove : ('a * 'b) list -> 'a -> ('a * 'b) list = <fun> *)

let li = (1,"o")::(2,"t")::(3,"g")::[];;
list_remove li 1;; (* - : (int * string) list = [(2, "t"); (3, "g")] *)


(*** Question 3 ***)

(* OCaml est implicitement générique. Du coup la fonction ci-dessous fonctionne 
   pour n'importe que type de liste *)
let rec list_map list fonction = 
  match list with
    | [] -> []
    | t::q -> (fonction t)::list_map q fonction;;

let doubler x = x+x;;
let l = 2::1::3::[];;
list_map l doubler;; (* - : int list = [4; 2; 6] *)

let displayKey (x,y) = print_int x; print_string " ";;
let lAssoc = [(1, "truc");(2,"bidule")];;
list_map lAssoc displayKey;;  (* 2 1 - : unit list = [(); ()] *)


(*** Question 4 ***)

let rec lists_concat list1 list2 =
  match list1 with
    | [] -> list1@list2 (* recursif terminal *)
    | t::q -> t::lists_concat q list2;;
(* val lists_concat : 'a list -> 'a list -> 'a list = <fun> *)

let listeAssoc1 = [(1, "truc");(2,"bidule")];;
let listeAssoc2 = [(3, "truc");(4,"bidule")];;
lists_concat listeAssoc1 listeAssoc2;;
(* - : (int * string) list =
[(1, "truc"); (2, "bidule"); (3, "truc"); (4, "bidule")] *)
