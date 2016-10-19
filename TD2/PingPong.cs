using System;
using Gtk;

public class PingPong {
	static void onClick (object obj, EventArgs args) {
		Console.WriteLine("I have been clicked by a {0}", obj); 
	}

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
		myBox.Add(ping);
		myBox.Add(pong);

		Action<object, EventArgs> del = (obj, args) => {
			Button button1 = (Button) obj;
			Console.WriteLine("Wooaw ! It is working ! {0} has been clicked",button1.Label);

			Button button2 ;
			if (button1.Label == "Ping") {
				button2 = pong;
				button1.Label = "Ping";
				button1.Sensitive = false;
				button2.Label = "Pong";
				button2.Sensitive = true;
			} else {
				button2 = ping;
				button1.Label = "Pong";
				button1.Sensitive = false;
				button2.Label = "Ping";
				button2.Sensitive = true;
			}
		};

		ping.Clicked += new EventHandler (del);
		pong.Clicked += new EventHandler (del);

		//Show Everything     
		myWin.ShowAll();

		Application.Run();   
	}
}

