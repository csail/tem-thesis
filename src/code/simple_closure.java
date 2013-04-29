class Closures {
	public static {int => int} adder(int term) {
		return { int x => term + x };
	}	
	public static {int => int} increment = adder(1);
	public static int six = increment.invoke(5);
}
