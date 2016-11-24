(***** Exercice 1 *****)

type 'a vertex = V of 'a
and 'a graph_full = Graph of ('a vertex * 'a vertex list) list;;

type 'k key = K of 'k
and ('k, 'a) vertex = 'k key * 'a 
and ('k, 'a) graph = Graph of (('k, 'a) vertex * 'k key list) list;;
 
Graph ([
  ((K 1, "Sapristi"), [K 2;K 3;K 4]);
  ((K 2, "Saperlotte"), [K 1;K 3]);
  ((K 3, "Sacrebleu"), [K 1;K 2]);
  ((K 4, "Sacristin"), [K 1]);
       ])
