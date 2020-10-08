import 'package:ed_project/collections/linked_list.dart';

class Stack {
  LinkedList _pila;

  Stack() {
    _pila = LinkedList();
  }

  void push(dynamic key) {
    _pila.pushFront(key);
  }

  dynamic pop() {
    final r = _pila.topFront();
    _pila.popFront();
    return r;
  }

  dynamic peek() {
    return _pila.topFront();
  }

  int size() {
    return _pila.size();
  }

  @override
  String toString() {
    return _pila.toString();
  }
}
