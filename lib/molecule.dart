import 'package:prog2_aval3/elements.dart';

class Molecule implements Comparable<Molecule>{
  String _formula = "";
  int _weigth = 0;
  Elements elements = Elements();

  Molecule({required formula,  String? name}){
    this.formula = formula;
  }

  set formula(String formula) {
    if (!formula.isNotEmpty){
      throw Exception('Fórmula vazia');
    }
    _formula = formula;
    _weigth = 0;

    RegExp expression = RegExp(r'(?<atom>[A-Z][a-z]?d*)(?<quantity>[0-9]*)');

    Iterable<RegExpMatch> molecules = expression.allMatches(formula.toString());

    for (final atom in molecules) {
      
      int quantity = 1;
      String number = atom.namedGroup('quantity').toString();
      String elem = atom.namedGroup('atom').toString();
      if (number == '1'){
        throw Exception('Fórmula inválida do elemento $elem$number : "1"');
      }
      
      if (number.isNotEmpty) {
        quantity = int.parse(number);
      }
      final currentElement = elements.filter(atom.namedGroup('atom').toString());
      _weigth += (currentElement.weight * quantity);
    }
  }

  int get weight {
    return _weigth;
  }

  String get formula {
    return _formula;
  }  

  @override
  int compareTo(Molecule other) {
    return weight - other.weight;
  }
}