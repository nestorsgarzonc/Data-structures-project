class Pair {
  dynamic _first;
  dynamic _second;

  Pair(this._first, this._second);

  dynamic get first => _first;

  set first(dynamic key) {
    _first = key;
  }

  dynamic get second => _second;

  set second(dynamic key) {
    _second = key;
  }

  bool isEquals(Pair x) => _first == x.first && _second == x.second;
}
