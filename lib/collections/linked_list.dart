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
      throw Exception("The LinkedList is empty");
    }
    return _head.value;
  }

  void popFront() {
    if (_size == 0) {
      throw Exception("The LinkedList is empty");
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
      throw Exception("The LinkedList is empty");
    }
    return _tail.value;
  }

  void popBack() {
    if (_size == 0) {
      throw Exception("The LinkedList is empty");
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
      throw Exception("The LinkedList is empty");
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
    }
    throw Exception("Value isn't in the Linked-List");
  }

  bool isEmpty() {
    return _size == 0;
  }

  int size() {
    return _size;
  }

  dynamic getIndex(int i) {
    if (i >= 0 && i < _size) {
      Node n = _head;
      while (i > 0) {
        n = n.nextValue;
        i--;
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
      throw Exception("Value isn't in the Linked-List");
    }
  }

  dynamic remove(int i) {
    if (i >= 0 && i < _size) {
      Node n = _head;
      while (i > 1) {
        n = n.nextValue;
        i--;
      }
      dynamic ans = n.nextValue.value;
      n.nextValue = n.nextValue.nextValue;
      _size--;
      return ans;
    } else {
      throw Exception("Index out of bounds");
    }
  }

  void add(int i, dynamic key) {
    if (i >= 0 && i < _size) {
      Node n = _head;
      if (i == 0) {
        pushFront(key);
        return;
      }
      while (i > 1) {
        n = n.nextValue;
        i--;
      }
      Node ins = Node(key);
      ins.nextValue = n.nextValue;
      n.nextValue = ins;
      _size++;
    } else {
      throw Exception("Index out of bounds");
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
