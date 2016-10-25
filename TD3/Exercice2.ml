(*** question 1 ***)
[];; (* # - : 'a list = [] ,, généricité et atomicité du module List *)
2::1::[];; (* - : int list = [1] ,, détermination du type des valeurs dans la liste *)
[1; 2];;
(* [(1, "truc");(2,"bidule")] : clef int, valeur string *)


let rec voir l =
   match l with
     | [] -> print_int 0
     | t::q->print_int t;  voir q;;


(*** question 2 ***)
let rec list_remove list key =
  let getKey (a,b)=a in
  match list with
    | []->[]
    | t::q->if(getKey(t)=key) then
	list_remove q key else
	t::list_remove q key;;
let li = (1,"o")::(2,"t")::(3,"g")::[];;
list_remove li 1;;

(*** question 3 ***)
let add x = x+x;;
let l = 2::1::3::[];;
let rec list_map list fonction = 
  match list with
    | [] -> []
    | t::q -> (fonction t)::list_map q fonction;;
list_map l add;;

(*** question 4 ***)
let l1 = 1::2::3::[];;
let l2 = 4::5::6::[];;
let rec list_concat list1 list2 = 
