
import 'dart:io';

//símbolo, nome em português, nome em latim e peso atômico.
class Element {
  String symbol;
  String name;
  String latinName;
  String weight;

  Element(this.symbol, this.name, this.latinName, this.weight);
  @override
  String toString() {
    return symbol;
  }
}


class Elements extends Iterable {
  final List<Element> _elements = [];
  final file = File('elements.csv').readAsLinesSync();
 
  // file.readAsLinesSync();
  Elements() {
    for (int i = 1; i < file.length; i++) {
    var li = file[i].split(',');
      String symbol = li[1];
      String name = li[2];
      String latinName = li[3];
      String weight = li[0];
      _elements.add(Element(symbol = symbol, name = name, latinName = latinName,
          weight = weight));
    }
  }

  @override
  Iterator<Element> get iterator => _elements.iterator;
}