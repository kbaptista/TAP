using System;
using System.Collections.Generic;
using System.Linq;

class Program {
	private static List<string> people = new List<string>() 
	{ 
		"Robert", "Roger", "Raymond", "Remi", 
		"Radicowl", "Ross", "Rififi", "Rossinante" 
	};


	/*question 1*/
	public static void More5LettersQueryStyle(){
		/*requete style*/
		IEnumerable<string> nquery = from p in people
				where p.Length >= 5
			select p;

		foreach (string person in nquery) 
			Console.WriteLine(person);
		Console.WriteLine();
	}

	/*question 2 */
	public static void More5LettersMethodStyle(){
		/*Method Style*/
		IEnumerable<string> squery = people.Cast<String> ().Where (p => p.Length >= 5);
		foreach (string person in squery) 
			Console.WriteLine(person);
		Console.WriteLine();
	}

	/*question 3 
Programmation fonctionnelle.




	*/


	/* Question 4 */
	public T Fold<T,U> (T res, List<U> list, Func<T, U, T> f)
	{
		foreach (U atchoum in list) {
			res = f (res, atchoum);
		}
		return res;
	}

	/* Question 5 */
	public T FoldIE<T,U> (T res, IEnumerator<U> list, Func<T, U, T> f)
	{
		while (list.MoveNext()) {
			res = f (res, list.Current);
		}
		return res;
	}

	/* Question 7 */
	public static void testFold(){
		int res = 0;
		res = FoldIE<int,string> (res, people, (p => res + 1));
	}

	public static void Main() 
	{
		IEnumerable<string> query = from p in people select p;
		Console.WriteLine("------");

		foreach (string person in query) 
			Console.WriteLine(person);
		Console.WriteLine();

		More5LettersQueryStyle ();
		More5LettersMethodStyle ();


	}
}
