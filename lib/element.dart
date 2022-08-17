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