using System;
using Gtk;

public struct Test
{
	public object b1, b2;

	public Test(object b1, object b2)
	{
		this.b1 = b1;
		this.b2 = b2;
	}
}

public class GtkHelloWorld {
	static void onClick (object obj, EventArgs args) {
		Console.WriteLine("I have been clicked by a {0}", obj);
		Button b = ((Button)obj);
		if (b.Sensitive)
			b.Sensitive = false;
	}

	/*
	static void onClick (Test obj, EventArgs args) {
		Console.WriteLine("I have been clicked by a {0}", obj);
		Button b1 = obj.b1;
		Button b2 = obj.b2;

		if (b1.Sensitive) {
			b1.Sensitive = false;
			b2.Sensitive = true;
		} else {
			b1.Sensitive = true;
			b2.Sensitive = false;
		}

	}*/

	delegate void MonDelegate (object obj, EventArgs args);

	public static void Main() {
		Application.Init();

		MonDelegate deleg = new MonDelegate (onClick);
		//Create the Window
		Window myWin = new Window("Brave new world");
		myWin.Resize(200,200);
		HBox myBox = new HBox (false, 10);
		myWin.Add(myBox);

		// Set up a button object.
		Button ping = new Button ("Ping");
		ping.Clicked += new EventHandler(deleg);
		myBox.Add(ping);

		// Set up a button object.
		Button pong = new Button ("Pong");
		pong.Clicked += new EventHandler(deleg);
		myBox.Add(pong);

		//Test t = new Test (ping, pong);
		//t.b1.Clicked += new EventHandler(deleg);
		//myBox.Add(ping);
		//t.b2.Clicked += new EventHandler(deleg);
		//myBox.Add(pong);


		//Show Everything     
		myWin.ShowAll(); 
		Application.Run(); }
}
