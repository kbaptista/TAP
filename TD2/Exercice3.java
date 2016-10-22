import java.sql.Array;
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
		Consumer<Integer> c=(Integer i) -> {System.out.print(i+" ; ");};
		myList.forEach(c);
		
		/**
		 * forEach est défini dans l'interface Iterable.
		 * c'est une méthode par défaut afin d'en ajouter la fonctionnalité à l'interface Iterable,
		 * tout en permettant de ne pas avoir aux anciens programme de devoir implementer cette méthode.
		 * On voit donc ici que cette méthode est apparue récemment dans Java.
		 */
		
System.out.println();
		List<Integer> list2 = Arrays.asList(18,11,1993,42,666);
		list2.forEach(c);
System.out.println();
		list2.sort( (Integer i, Integer j) -> { return j.compareTo(i); });
		list2.forEach(c);
	}
}
