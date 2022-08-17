import 'dart:io';
import 'element.dart';

class Elements extends Iterable {
  static final Elements _instance = Elements._insideConstructor();
  factory Elements() {
    return _instance;
  }
  final List<Element> content = [];
  Elements._insideConstructor() {
    final file = File('file/elements.csv').readAsLinesSync();
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
      final selectedElement = Elements()
          .content
          .firstWhere((element) => element.symbol == substance);
      return selectedElement;
    } catch (_) {
      throw Exception('Elemento não encontrado.');
    }
  }
}