(*** Exercice  1  ***)
 
type 'a frozen_flow = 
| End of 'a
| Step of (unit -> 'a frozen_flow);;

let thaw input =
  match input with
    | End x -> End x
    | Step f -> f ();; (* () est le type de base, analogue à null en c *)


let ppcm x y =
  let rec ppcm_rec x y mul = 
    if (y > x) then (ppcm_rec y x mul) else (* Ensures x >= y *)
    if (x = 0) then 0 else                  (* Ensures both are positive *)
      let r = (x mod y) in 
        if (r = 0) then (mul/y) else ppcm_rec y r mul
  in ppcm_rec x y (x*y);;
 
type ('key,'data) frozen_data_flow = 
| End of 'data
| Step of (unit -> (('key*'data) list) * ('key,'data) frozen_data_flow);;

