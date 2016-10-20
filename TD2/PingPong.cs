/*
 * TD2 Exercice 2.3
 *  Pour le compiler : mcs PingPong.cs
 *  Pour l'exécuter : mono PingPong.exe
 * 
 *  Résultat :
 *   Une fenêtre composée de 2 boutons "Ping" et "Pong" qui ne sont cliquables qu'un clic sur deux et
 *   qui au clic sur eux affichent leur nom.
 * 
 */

using System;
using Gtk;

public class PingPong {

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

		Action<object, EventArgs> deleg = (obj, args) => {
			Button button1 = (Button) obj;
			Console.WriteLine("Wooaw ! It is working ! {0} has been clicked !",button1.Label);

			Button button2 ;
			if (button1.Label == "Ping") {
				button2 = pong;
				button1.Sensitive = false;
				button2.Sensitive = true;
			} else {
				button2 = ping;
				button1.Sensitive = false;
				button2.Sensitive = true;
			}
		};

		ping.Clicked += new EventHandler (deleg);
		pong.Clicked += new EventHandler (deleg);

		/* Tester la fermeture du code revient à la modification des références des objets 
		 * et voir si ça fonctionne (les 2 lignes commentées ci-dessous permettent le test).
		 * 
		 * Résultat : Malgré que le if, de l'event handler deleg, ne porte que sur le label 
		 *  du bouton cliqué, un changement de référence des boutons fait que les boutons 
		 *  "initiaux" restent bloqués dans un état (ici "non cliquable" à cause du jeu avec
		 *  les propriétés Sensitive).
		 * 
		 * Conséquence : Changer les références d'un objet en C# est par obligation accompagné 
		 *  de la réinitialisation de son environnement : ici réaffectation de son event handler 
		 *  et ajout dans la fenêtre.
		 */
		//ping = new Button ("Ping");
		//pong = new Button("Pong");

		//Show Everything     
		myWin.ShowAll();

		Application.Run();   
	}
}