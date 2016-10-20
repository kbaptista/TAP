/*
 * TD2 Exercice 2.1
 *  Pour le compiler : mcs td2_21.cs
 *  Pour l'exécuter : mono td2_21.exe
 * 
 *  Résultat :
 *   3
     Carambaaaaaaaa !
 * 
 */

using System;

namespace Application
{
	
	public class Program
	{
		public static Func<int, int, int> Add = (i,j) => i+j;

		public delegate int DelegAdd (int a, int b, Func<int,int,int> f);
		public static DelegAdd da = (a,b,f) => f(a,b);

		public static void Main()
		{
			Console.WriteLine(da(1, 2, Add));
			Console.WriteLine ("Carambaaaaaaaa !");
		}
	}
}

