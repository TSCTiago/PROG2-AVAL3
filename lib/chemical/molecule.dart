class Molecule {
  late String _formula;
  String name;
  dynamic _weigth;

  Molecule({ required formula, required this.name}){
    this.formula = formula;
  }


  set formula(String formula) {
    _formula = formula; //colocar caso de erro
    RegExp expression = RegExp(r'(?<atom>[A-Z][a-z]?d*)(?<quantity>[0-9]*)');

    Iterable<RegExpMatch> molecules = expression.allMatches(formula.toString());

    final List<Map<String, dynamic>> atomos = [];

    for (final atom in molecules) {

      dynamic quantity = atom.namedGroup('quantity');
      if (quantity == '') {
        quantity = 1;
      }
      print(int.parse(quantity));
      _weigth = quantity;
      atomos.add({'atomo': atom.namedGroup('atom'), 'quantity': quantity});
    }
  }

  int get weight {
    return 1;
  }
  //String get formula => formula;
  //
  String get formula {
    return _formula;
  }
}
