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
      'Veggie/No Protein': true,
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

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      selectedBread: json['selectedBread'].cast<String, bool>(),
      numProtein: json['numProtein'] as int,
      selectedProtein: (json['selectedProtein']).cast<String, bool>(),
      selectedCheese: (json['selectedCheese']).cast<String, bool>(),
      numVeggies: json['numVeggies'] as int,
      selectedVeggies: (json['selectedVeggies']).cast<String, bool>(),
      numSauce: json['numSauce'] as int,
      selectedSauce: (json['selectedSauce']).cast<String, bool>(),
      numToppings: json['numToppings'] as int,
      selectedToppings: (json['selectedToppings']).cast<String, bool>(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'selectedBread': {
        'Italian': selectedBread['Italian'],
        'Italian Herbs & Cheese': selectedBread['Italian Herbs & Cheese'],
        'Multigrain': selectedBread['Multigrain'],
        'Flatbread': selectedBread['Flatbread'],
        'Wrap': selectedBread['Wrap'],
        'Bowl': selectedBread['Bowl'],
      },
      'numProtein': numProtein,
      'selectedProtein': {
        'Turkey': selectedProtein['Turkey'],
        'Grilled Chicken': selectedProtein['Grilled Chicken'],
        'Rotisserie Chicken': selectedProtein['Rotisserie Chicken'],
        'Teriyaki Chicken': selectedProtein['Teriyaki Chicken'],
        'Buffalo Chicken': selectedProtein['Buffalo Chicken'],
        'Ham': selectedProtein['Ham'],
        'Steak': selectedProtein['Steak'],
        'Tuna': selectedProtein['Tuna'],
        'Turkey & Ham': selectedProtein['Turkey & Ham'],
        'Veggie/No Protein': selectedProtein['Veggie/No Protein'],
      },
      'selectedCheese': {
        'American': selectedCheese['American'],
        'Provolone': selectedCheese['Provolone'],
        'PepperJack': selectedCheese['PepperJack'],
        'Cheddar': selectedCheese['Cheddar'],
        'Mozzarella': selectedCheese['Mozzarella'],
      },
      'numVeggies': numVeggies,
      'selectedVeggies': {
        'Lettuce': selectedVeggies['Lettuce'],
        'Spinach': selectedVeggies['Spinach'],
        'Tomatoes': selectedVeggies['Tomatoes'],
        'Cucumbers': selectedVeggies['Cucumbers'],
        'Onions': selectedVeggies['Onions'],
        'Green Peppers': selectedVeggies['Green Peppers'],
        'Olives': selectedVeggies['Olives'],
        'Banana Peppers': selectedVeggies['Banana Peppers'],
        'Pickles': selectedVeggies['Pickles'],
        'Jalapenos': selectedVeggies['Jalapenos'],
      },
      'numSauce': numSauce,
      'selectedSauce': {
        'Mayo': selectedSauce['Mayo'],
        'Chipotle': selectedSauce['Chipotle'],
        'Honey Mustard': selectedSauce['Honey Mustard'],
        'Ranch': selectedSauce['Ranch'],
        'Sweet Onion': selectedSauce['Sweet Onion'],
        'Buffalo': selectedSauce['Buffalo'],
        'Mustard': selectedSauce['Mustard'],
        'Vinaigrette': selectedSauce['Vinaigrette'],
        'Garlic Aioli': selectedSauce['Garlic Aioli'],
        'Oil': selectedSauce['Oil'],
        'Vinegar': selectedSauce['Vinegar'],
      },
      'numToppings': numToppings,
      'selectedToppings': {
        'Salt': selectedToppings['Salt'],
        'Pepper': selectedToppings['Pepper'],
        'Salt & Pepper': selectedToppings['Salt & Pepper'],
        'Oregano': selectedToppings['Oregano'],
        'Parm': selectedToppings['Parm'],
      },
    };
  }
}
