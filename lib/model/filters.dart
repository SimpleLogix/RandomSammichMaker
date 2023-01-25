/// data class to hold the options (as well as default options)
///
class Filters {
  int numProtein;
  Map<String, bool> selectedProtein;
  Map<String, bool> selectedBread;
  Map<String, bool> selectedCheese;
  int numVeggies;
  Map<String, bool> selectedVeggies;
  int numSauce;
  Map<String, bool> selectedSauce;
  int numToppings;
  Map<String, bool> selectedToppings;

  Filters({
    this.selectedBread = const {
      'Italian': true,
      'Italian Herbs & Cheese': true,
      'Multigrain': true,
      'Flatbread': true,
      'Wrap': true,
      'Bowl': true,
    },
    this.numProtein = 1,
    this.selectedProtein = const {
      'Turkey': true,
      'Grilled Chicken': true,
      'Rotisserie Chicken': true,
      'Teriyaki Chicken': true,
      'Buffalo Chicken': true,
      'Ham': true,
      'Steak': true,
      'Tuna': true,
      'Turkey & Ham': true,
    },
    this.selectedCheese = const {
      'American': true,
      'Provolone': true,
      'PepperJack': true,
      'Cheddar': true,
      'Mozzarella': true,
    },
    this.numVeggies = 3,
    this.selectedVeggies = const {
      'Lettuce': true,
      'Spinach': true,
      'Tomatoes': true,
      'Cucumbers': true,
      'Onions': true,
      'Green Peppers': true,
      'Olives': true,
      'Banana Peppers': true,
      'Pickles': true,
      'Jalapenos': true,
    },
    this.numSauce = 2,
    this.selectedSauce = const {
      'Mayo': true,
      'Chipotle': true,
      'Honey Mustard': true,
      'Ranch': true,
      'Sweet Onion': true,
      'Buffalo': true,
      'Mustard': true,
      'Vinaigrette': true,
      'Garlic Aioli': true,
      'Oil': true,
      'Vinegar': true,
    },
    this.numToppings = 1,
    this.selectedToppings = const {
      'Salt': true,
      'Pepper': true,
      'Salt & Pepper': true,
      'Oregano': true,
      'Parm': true,
    },
  });
}
