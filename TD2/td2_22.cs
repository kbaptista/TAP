/*
 * TD2 Exercice 2.2
 *  Pour le compiler : mcs -pkg:gtk-sharp-2.0 td2_22.cs
 *  Pour l'exécuter : mono td2_22.exe
 * 
 *  Résultat : Fenêtre composée d'un bouton appelé Hello qui renvoie 4 pour chaque clic dessus
 * 
 */

using System;
using Gtk;

public class GtkOnClick {
	public static Func<int, int, int> Add = (i,j) => i+j;
	public delegate int Deleg (int a, int b, Func<int,int,int> f);
	public static Deleg d = (a,b,f) => f(a,b);


	static void onClick (object obj, EventArgs args) {
		Console.WriteLine(d(1,3, Add)); //utilisation d'une fonction déléguée
		//Console.WriteLine("I have been clicked by a {0}", obj); 
	}


	public static void Main() {
		Application.Init();

		//Create the Window
		Window myWin = new Window("Brave new world");
		myWin.Resize(200,200);
		HBox myBox = new HBox (false, 10);
		myWin.Add(myBox);

		// Set up a button object.
		Button hello = new Button ("Hello");
		hello.Clicked += new EventHandler(onClick);
		myBox.Add(hello);

		//Show Everything     
		myWin.ShowAll(); 
		Application.Run(); 
	}
}