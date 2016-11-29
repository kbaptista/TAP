(***** Exercice 1 *****)

(* Question 1 *)
type 'a vertex = V of 'a
and 'a graph_full = Graph of ('a vertex * 'a vertex list) list;;

let mon_graphe_string = Graph ([
  ((V "Sapristi"), [(V "Saperlotte");(V "Sacrebleu");(V "Sacristin")]);
  ((V "Saperlotte"), [(V "Sapristi");(V "Sacrebleu")]);
  ((V "Sacrebleu"), [(V "Sapristi");(V "Saperlotte")]);
  ((V "Sacristin"), [(V "Sapristi")]);
]);;


(* Question 2 *)
  (* 
     Le problème vient du fait qu'en mofifiant la valeur d'un sommet,
     il faudrait le retrouver parmis les liens de chaque sommet du graphe,
     et appliquer la même modification.
  *)


(* Question 3 *)

type 'k key = K of 'k
and ('k, 'a) vertex = 'k key * 'a 
and ('k, 'a) graph = Graph of (('k, 'a) vertex * 'k key list) list;;

let mon_graphe = Graph ([
  ((K 1, "Sapristi"), [K 2;K 3;K 4]);
  ((K 2, "Saperlotte"), [K 1;K 3]);
  ((K 3, "Sacrebleu"), [K 1;K 2]);
  ((K 4, "Sacristin"), [K 1]);
]);;

(*
  On définit un sommet comme un couple clé-valeur.
  Les voisins de chaque sommet sont donc listés par leur clé.
*)
 
(* Question 4 *)
  
let graph_nexts(Graph g) som =
  List.assoc som (List.map (fun ((k, _),n) -> (k, n)) g);;
(* val graph_nexts : ('a, 'b) graph -> 'a key -> 'a key list = <fun> *)

graph_nexts mon_graphe (K 1);;
(* - : int key list = [K 2; K 3; K 4] *)


(* Question 5 *)

let graph_map(Graph g) f =
  Graph (List.map (fun ((k, word),n) -> ((k, f word), n)) g);;

graph_map mon_graphe String.length;;


(* Question 6 : pas faite dans l'autre groupe, on suppose donc qu'il en va de même *)

let component(Graph g) =
  ;;
