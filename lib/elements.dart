import 'dart:io';
import 'element.dart';

class Elements extends Iterable {
  static final Elements _instance = Elements._privateConstructor();
  factory Elements() {
    return _instance;
  }
  final List<Element> content = [];
  Elements._privateConstructor() {
    final file = File('elements.csv').readAsLinesSync();
    for (int i = 1; i < file.length; i++) {
      var lineData = file[i].split(',');
      String symbol = lineData[1];
      String name = lineData[2];
      String latinName = lineData[3];
      int weight = int.parse(lineData[0]);
      content.add(Element(symbol = symbol, name = name, latinName = latinName,
          weight = weight));
    }
  }

  @override
  Iterator<Element> get iterator => content.iterator;

  Element filter(String substance) {
    try {
      final listofSelectedElements = Elements()
          .content
          .where((atom) => atom.symbol == substance)
          .toList();
      return listofSelectedElements[0];
    } catch (_) {
      throw Exception('Elemento não encontrado');
    }
  }
}
