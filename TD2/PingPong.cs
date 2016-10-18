using System;
using Gtk;

public class GtkHelloWorld {
	static void onClick (object obj, EventArgs args) {
		Console.WriteLine(d (1,3, Add));
		//Console.WriteLine("I have been clicked by a {0}", obj); 
	}

	public delegate void ClickerHero (Button a, Button b);
	public static ClickerHero c = (a, b) =>
	{a.Sensitive = false; b.Sensitive = true;};

	public static Func<int, int, int> Add = (i,j) => i+j;

	public delegate int Deleg (int a, int b, Func<int,int,int> f);
	public static Deleg d = (a,b,f) => f(a,b);

	public static void Main() {
		Application.Init();

		//Create the Window
		Window myWin = new Window("Brave new world");
		myWin.Resize(200,200);
		HBox myBox = new HBox (false, 10);
		myWin.Add(myBox);

		// Set up a button object.
		Button ping = new Button ("Ping");
		Button pong = new Button ("Pong");
		ping.Clicked += new EventHandler((object , EventArgs args) {
			Console.WriteLine(d (1,3, Add));
			//Console.WriteLine("I have been clicked by a {0}", obj); 
		});
		pong.Clicked += new EventHandler(ClickerHero(ping,pong));
		myBox.Add(ping);
		myBox.Add(pong);


		//Show Everything     
		myWin.ShowAll(); 
		Application.Run(); }
}

