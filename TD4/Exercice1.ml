(*
  fold_left : applique recursivement f en parcourant la liste de gauche à droite : 
                   - on commence par f(init e1) (dont on nommera le résultat X(1))
                   - puis on applique f( X(1) e2) (dont on nommera le résultat X(2))
                   - on obtient donc f( X(i-1) ei) ou i est l'indice de l'élement dans la liste

  fold_right : même principe qu'au-dessus, sauf qu'on parcourt la liste de droite à gauche :
                   - on commence par f(en init) (dont on nommera le résultat X(1))
                   - puis on applique f(en-1 X(1)) (dont on nommera le résultat X(2))
                   - on obtient donc f(e(n-i) X(i)) ou i est l'indice de l'élement dans la liste en partant de la fin

La différence majeure est que le fold_left doit "dérouler" toute la liste pour commencer à effectuer le traitement et remonter son résultat, alors que le fold_right a une récursivité terminale.
*)

let sum list =
  List.fold_right (+) list 0;;

let length list =
  List.fold_right (fun acc x -> acc + 1) list 0;;

let maximum list =
  List.fold_right (fun max x -> if(max>x) then max else x ) list (List.hd list);;
  
let rec list_or list =
  match list with
      [] -> false
    | a::list ->if(a==true) then true else list_or list;;
  
