using System;

namespace Application
{
	
	public class Program
	{
		// Type declaration
		public delegate int OneInt (int value);
		// Anonymous function
		public static OneInt square = new OneInt(i => i*i);
		// One-time declaration using predefined type
		public static Func<int, int> cube = i => i*i*i;
		// Delegate using multiple arguments
		public delegate void Concat (string s1, string s2);
		public static Concat c = (a,b) =>
			Console.WriteLine(a+b);

		public static Func<int, int, int> Add = (i,j) => i+j;

		public delegate int trucmuuuuuush (int a, int b, Func<int,int,int> f);
		public static trucmuuuuuush t = (a,b,f) => f(a,b);

		public static void Main()
		{
			Console.WriteLine(t(1, 2, Add));
			Console.WriteLine ("Carambaaaaaaaa !");
		}
	}
}

