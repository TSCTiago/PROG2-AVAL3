import 'dart:io';

class Element {
  String symbol;
  String name;
  String latinName;
  int weight;

  Element(this.symbol, this.name, this.latinName, this.weight);
  @override
  String toString() {
    return symbol;
  }
}

class Elements extends Iterable {
  static final Elements _instance = Elements._privateConstructor();
  factory Elements() {
    return _instance;
  }
  final List<Element> elements = [];
  Elements._privateConstructor() {
    final file = File('elements.csv').readAsLinesSync();
    for (int i = 1; i < file.length; i++) {
      var li = file[i].split(',');
      String symbol = li[1];
      String name = li[2];
      String latinName = li[3];
      int weight = int.parse(li[0]);
      elements.add(Element(symbol = symbol, name = name, latinName = latinName,
          weight = weight));
    }
  }

  @override
  Iterator<Element> get iterator => elements.iterator;

  Element filter(String substance) {
    try {
      final listofSelectedElements = Elements()
          .elements
          .where((atom) => atom.symbol == substance)
          .toList();
      return listofSelectedElements[0];
    } catch (_) {
      throw Exception('Elemento não encontrado');
    }
  }
}
