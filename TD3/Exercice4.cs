using System;
using System.Collections.Generic;

class Program{

	/***** Map ? *****/
	public delegate void Map<T1, T2>(List<KeyValuePair<T1, T2>> l, Func<T2,T2> f);

	public static void Main(){
		// Create an association list
		List<KeyValuePair <int, string>> list = new List<KeyValuePair <int, string>>();

		// Fill it with interesting values
		list.Add(new KeyValuePair<int, string>(1,"un"));
		list.Add(new KeyValuePair<int, string>(7,"sept"));
		list.Add(new KeyValuePair<int, string>(1,"uno"));


		// Get a collection of the keys (names). 
		List<int> keys = Map<int,string>(list, i => i.Key);

		// Print the values
		//foreach (int k in keys)
		//	Console.WriteLine("{0} : {1}", k, list.Find( i => (i.Key == k)).Value);  


	}
