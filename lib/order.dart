class Order{
  final String _date;
  final String _flavor;
  final String _size;
  final String _cost;

  Order(this._date, this._flavor, this._size, this._cost);

  @override
  String toString(){
    return "Date: " + _date + "\nFlavor: " + _flavor +
    "\nSize: " + _size + "\nCost: \$" + _cost;
  }
}