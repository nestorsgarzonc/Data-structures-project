import 'package:ed_project/collections/node.dart';

class LinkedList {
  Node _head;
  Node _tail;
  int _size;

  LinkedList() {
    _head = null;
    _size = 0;
    _tail = null;
  }

  LinkedList.fromList(List lista) {
    makeEmpty();
    for (dynamic i in lista) {
      pushBack(i);
    }
  }

  void pushFront(dynamic key) {
    if (_head == null) {
      _head = Node(key);
      _tail = Node(key);
    } else {
      final Node n = Node(key);
      n.nextValue = _head;
      _head = n;
    }
    _size++;
  }

  dynamic topFront() {
    if (_size == 0) {
      throw Exception("The collection is empty");
    }
    return _head.value;
  }

  void popFront() {
    if (_size == 0) {
      throw Exception("The collection is empty");
    }
    _head = _head.nextValue;
    _size--;
  }

  void pushBack(dynamic key) {
    if (_head == null) {
      _tail = _head = Node(key);
    } else {
      final Node n = Node(key);
      _tail.nextValue = n;
      _tail = _tail.nextValue;
    }
    _size++;
  }

  dynamic topBack() {
    if (_size == 0) {
      throw Exception("The collection is empty");
    }
    return _tail.value;
  }

  void popBack() {
    if (_size == 0) {
      throw Exception("The collection is empty");
    }
    if (_size == 1) {
      _head = null;
      _tail = null;
    } else {
      Node n = _head;
      while (n.nextValue.nextValue != null) {
        n = n.nextValue;
      }
      n.nextValue = null;
      _tail = n;
    }
    _size--;
  }

  bool find(dynamic key) {
    Node n = _head;
    bool ans = false;
    while (n != null) {
      if (n.value == key) {
        ans = true;
        break;
      }
      n = n.nextValue;
    }
    return ans;
  }

  void erase(dynamic key) {
    if (_size == 0) {
      throw Exception("The collection is empty");
    }
    Node n = _head;
    if (n.value == key) {
      popFront();
      return;
    }
    while (n.nextValue != null) {
      if (n.nextValue.value == key) {
        n.nextValue = n.nextValue.nextValue;
        _size--;
        return;
      }
      n = n.nextValue;
    }
    throw Exception("Value isn't in the collection");
  }

  bool isEmpty() {
    return _size == 0;
  }

  int size() {
    return _size;
  }

  dynamic getValue(int i) {
    int tempI = i;
    if (tempI >= 0 && tempI < _size) {
      Node n = _head;
      while (tempI > 0) {
        n = n.nextValue;
        tempI--;
      }
      return n.value;
    } else {
      throw Exception("Index out of bounds");
    }
  }

  int indexOf(dynamic key) {
    Node n = _head;
    int ans = 0;
    while (n != null) {
      if (n.value == key) {
        break;
      }
      n = n.nextValue;
      ans++;
    }
    if (ans < _size && _size > 0) {
      return ans;
    } else {
      throw Exception("Value isn't in the collection");
    }
  }

  dynamic remove(int i) {
    int tempI = i;
    if (tempI >= 0 && tempI < _size) {
      Node n = _head;
      while (tempI > 1) {
        n = n.nextValue;
        tempI--;
      }
      final dynamic ans = n.nextValue.value;
      n.nextValue = n.nextValue.nextValue;
      _size--;
      return ans;
    } else {
      throw Exception("Index out of bounds");
    }
  }

  void add(int i, dynamic key) {
    int tempI = i;
    if (tempI >= 0 && tempI <= _size) {
      Node n = _head;
      if (tempI == 0) {
        pushFront(key);
        return;
      }
      while (tempI > 1) {
        n = n.nextValue;
        tempI--;
      }
      final Node ins = Node(key);
      ins.nextValue = n.nextValue;
      n.nextValue = ins;
      _size++;
    } else {
      throw Exception("Index out of bounds");
    }
  }

  void makeEmpty() {
    _head = null;
    _tail = null;
    _size = 0;
  }

  dynamic firstWhere(bool test(dynamic element), {dynamic Function() orElse}) {
    Node n = _head;
    while (n != null) {
      if (test(n.value)) return n.value;
      n = n.nextValue;
    }
    if (orElse != null) return orElse();
    throw Exception("En elemento no existe");
  }

  void removeWhere(bool test(dynamic element)) {
    Node n = _head;
    while (n == _head && test(n.value)) {
      popFront();
      n = _head;
    }
    while (n.nextValue != null) {
      if (test(n.nextValue.value))
        n.nextValue = n.nextValue.nextValue;
      else
        n = n.nextValue;
    }
  }

  @override
  String toString() {
    String salida = "";
    Node n = _head;
    while (n != null) {
      // ignore: use_string_buffers
      salida += '${n.value}\n';
      n = n.nextValue;
    }
    return salida;
  }
}
