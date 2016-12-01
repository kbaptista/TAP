(*** Question  1  ***)

type 'a frozen_flow = 
| End of 'a
| Step of (unit -> 'a frozen_flow);;

let thaw input =
  match input with
    | End x -> End x
    | Step f -> f ();; (* () est le type de base, analogue à null en c *)

(*** Question 2 ***)

let ppcm x y =
  let rec ppcm_rec x y mul = 
    if (y > x) then Step (fun () -> ppcm_rec y x mul) else (* Ensures x >= y *)
    if (x = 0) then End 0 else                  (* Ensures both are positive *)
      let r = (x mod y) in 
        if (r = 0) then End (mul/y) else Step (fun () -> ppcm_rec y r mul)
  in  ppcm_rec x y (x*y);;
 
type ('key,'data) frozen_data_flow = 
| End of 'data
| Step of (unit -> (('key*'data) list) * ('key,'data) frozen_data_flow);;

let ppcm2 x y =
  let rec ppcm_rec2 x y mul =
    if (y > x) then Step (fun () -> ( [("x",y);("y",x)], ppcm_rec2 y x mul)) else
      if (x = 0) then End 0 else
	let r = (x mod y) in
	if (r = 0) then End (mul/y) else Step (fun () -> ( [("x",y);("y",x)], ppcm_rec2 y x mul))
  in ppcm_rec2 x y (x*y);;
