import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

public class Exercice3 {

	public static void main(String[] args) {
		List<Integer> myList = new ArrayList<Integer>();
		for (int i = 0; i < 24; i++) {
			myList.add(i);
		}
		Consumer<Integer> c = (Integer i) -> { System.out.print(i+" ; "); }; //lambda-expression
		
		myList.forEach(c);
		System.out.println();

		/**
		 * forEach est définie dans l'interface Iterable.
		 * C'est une méthode par défaut qui permet d'ajouter une fonctionnalité d'itération à l'interface Iterable,
		 * tout en permettant aux anciens programmes de ne pas avoir à implémenter cette méthode.
		 * On peut noter ici que cette méthode est apparue récemment dans Java.
		 */

		List<Integer> list2 = Arrays.asList(18,11,1993,42,66);
		list2.forEach(c);
		System.out.println();
		
		list2.sort((Integer i, Integer j) -> { return j.compareTo(i); }); //lambda-expression
		list2.forEach(c);
		System.out.println();

		/**
		 * En java, le compilateur déduira le type de la lambda-expression en fonction d'où elle se trouve et de ce
		 *  qu'elle doit faire. 
		 *  Par exemple si elle fait l'objet d'un paramètre fonctionnel d'une fonction (ici forEach() et sort()),le 
		 *  compilateur saura si le type de ses paramètres d'entrée et son type de retour sont corrects : 
		 *  i.e qui corrrespondent à la signature de la fonction attendue.
		 *  
		 * En C#, il faut préciser clairement le type de retour de la variable à laquelle est affectée une fonction 
		 *   anonyme sinon le compilateur ne connaîtra ni le type de la variable ni le type de retour de la
		 *   lambda-expression. Le compilateur C# n'analyse le type de retour de la lambda-expression que grace à 
		 *   son environnement, et donc en connaissant le type de la variable affectée.
		 */
	}
}
