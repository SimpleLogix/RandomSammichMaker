/// data class to hold the sammich
class Sammich {
  String bread;
  List<String> protein;
  String cheese;
  List<String> veggies;
  List<String> sauces;
  List<String> toppings;

  Sammich(
      {required this.bread,
      required this.cheese,
      required this.veggies,
      required this.protein,
      required this.sauces,
      required this.toppings});
}
