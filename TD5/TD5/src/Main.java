import java.util.ArrayList;
import java.util.List;

/* Exercice 2 */
public class Main {
	
	/* Question 1 */
	// On perd de la compatibilité de types
	public static void Question1() {
		List<Integer> lintint = new ArrayList<Integer>();
		// List<Integer> lintnum = new ArrayList<Number>(); impossible

		// List<Number> lnumint = new ArrayList<Integer>(); impossible 
		List<Number> lnumnum = new ArrayList<Number>();
	}

	
	/* Question 2 */
	
	public static class Fruit {
		String n;
		public Fruit(String nom){
			this.n = nom;
		}
		public String toString(){
			return this.n;
		}
	}

	public static class Orange extends Fruit {

		public Orange(String nom) {
			super(nom);
		}
				
	}
	
	public static void testerExtendsFruits(List<? extends Fruit> liste){
		Fruit g = liste.get(0);
		// Orange orange = liste.get(0);
		// ne compile pas : "Type mismatch: cannot convert ? extends Main.Fruit to Main.Orange"
	}
		
	public static void testerSuperFruits(List<? super Fruit> liste){
		liste.add(new Orange("Orange"));
	}
	
	public static void testerFruits(List<Fruit> liste){
		// Orange orange = liste.get(0);
		// réclame un cast de l'élément récupéré en Orange car il n'est pas forcément de type Orange  
		liste.add(new Orange("Orange"));
	}

	public static void Question2() {
		Fruit f = new Fruit("Banane");
		Orange o = new Orange("Clémentine");
		
		List<Orange> lor = new ArrayList<Orange>();
		lor.add(o);
		
		List<Fruit> lfr = new ArrayList<Fruit>();
		lfr.add(f);
		lfr.add(o);
		
		testerExtendsFruits(lor);
		testerExtendsFruits(lfr);
		
		testerSuperFruits(lfr);
		// testerSuperFruits(lor); 
		//ne compile pas : "not applicable for the arguments (List<Main.Orange>)"
		
		testerFruits(lfr);
		// testerFruits(lor);
		// ne compile pas : " testerFruits(List<Main.Fruit>) is not applicable for the arguments (List<Main.Orange>) "

	}
	
	/* Question 5 */
	
	/* TO CONTINUE */
	public static List<T> flatten(List<List<T>> l){
		List<T> res = new ArrayList<T>();
		for (T t : l) {
			res.add(t);
		}
		
		return res;
	}
	
	public static void Question5() {
		Fruit f = new Fruit("Banane");
		Orange o = new Orange("Clémentine");
		
		List<Orange> lor = new ArrayList<Orange>();
		lor.add(o);
		
		List<Fruit> lfr = new ArrayList<Fruit>();
		lfr.add(f);
		lfr.add(o);
		
		List<Fruit> list = flatten(lor, lfr);
		
	}

	
	public static void main(String[] args) {
		Question1();
		Question2();
	}

}
