/*
 * Classe à compiler en ligne de commande avec :
 * mcs Exercice4.cs ; mono Exercice4.exe
 */

using System;
using System.Collections.Generic;

class Program {
	/*** Question 1 : Map ***
	 * 
	 *  Malgré différents tests et choix de codage, nous n'avons pas réussi à réaliser 
	 * l'équivalent de notre fonction list_map OCaml. C'est justement à cause des 
	 * désagréments cités en réponse à la Question 3 de l'exercice (cf ci-dessous).
	 */

	//private delegate void Map<T>(T l, Action<T> f);

	/*
	public static void afficherKey<T1, T2>(KeyValuePair<T1, T2> elem){
		return elem.Key;
	}
	*/
	/*
	public static int doubler(KeyValuePair<int, string> elem){
		return elem.Key*2;
	}
	*/
	/*
	private List<int> Map<T1,T2>(List<KeyValuePair<T1,T2>> liste, Action<T1> fonction) {
		List<int> result = new List<int> ();
		foreach (KeyValuePair<T1, T2> i in liste) {
			i.Key = fonction (i);
			result.Add ((int)i.Key);
		}
		return result;
	}
	*/


	/*** Question 2 ***/

	public static Dictionary<T1,List<T2>> construire<T1,T2>(List<KeyValuePair<T1,T2>> listeAssoc) {
		Dictionary<T1, List<T2>> resultat = new Dictionary<T1, List<T2>> ();
		foreach (KeyValuePair<T1,T2> i in listeAssoc) {
			if (resultat.ContainsKey (i.Key))
				resultat [i.Key].Add (i.Value);
			else {
				List<T2> values = new List<T2> ();
				values.Add (i.Value);
				resultat.Add (i.Key, values);
			}
		}
		return resultat;
	}


	public static void Main() {
		
		// Create an association list
		List<KeyValuePair <int, string>> list = new List<KeyValuePair <int, string>>();

		// Fill it with interesting values
		list.Add(new KeyValuePair<int, string>(1,"un"));
		list.Add(new KeyValuePair<int, string>(7,"sept"));
		list.Add(new KeyValuePair<int, string>(1,"uno"));

		// Get a collection of the keys (names). 
		//List<int> keys = Map<List<KeyValuePair<int, string>>(list, i => i.Key);
		//List<int> keys = Map<int, string>(list, i => i.Key);

		/*List<int> keys = Map<int, string, KeyValuePair<int, string>>(list, i => i.Key);*/

		// Print the values
		//foreach (int k in keys)
		//Console.WriteLine("{0} : {1}", k, list.Find( i => (i.Key == k)).Value);  


		/*** Question 2 : appel ***/
		Dictionary<int, List<string>> d = construire<int, string> (list);
		Console.WriteLine ("Mon dictionnaire : ");
		Console.Write ("[ "); 
			
		foreach (int key in d.Keys) {
			Console.Write ("({0}, [", key);
			foreach (string value in d[key]) {
				Console.Write ("{0}; ", value);
			}
			Console.Write (" ]); ", key);
		}
		Console.WriteLine (" ]");



		/*** Question 3 ***
		 * 
		 * La programmation générique en C# apporte des désagréments par rapport à
		 * la programmation générique en OCaml :
		 *  -> Elle est explicite contrairement à celle en OCaml
		 *  -> Rendre générique une fonction C# oblige à la remodeler complètement
		 * 		(son contenu, sa signature et même les appels à cette fonction)
		 * 
		 * En résumé, nous avons compris comment fonctionnent la généricité et le rôle
		 * des variables de types. Malheureusement, nous n'avons pas tout-à-fait trouvé 
		 * comment l'implémenter en C#.
		 */

	}
}
