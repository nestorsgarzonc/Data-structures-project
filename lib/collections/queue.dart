import 'package:ed_project/collections/linked_list.dart';
import 'package:ed_project/collections/node.dart';

class Queue {
  LinkedList _cola;

  Queue() {
    _cola = LinkedList();
  }

  void enqueue(dynamic key) {
    _cola.pushBack(key);
  }

  dynamic dequeue() {
    dynamic n = _cola.topFront();
    _cola.popFront();
    return n;
  }

  dynamic peek() {
    return _cola.topFront();
  }

  bool isEmpty() {
    return _cola.isEmpty();
  }

  void makeEmpty() {
    _cola.makeEmpty();
  }

  @override
  String toString() {
    return _cola.toString();
  }
}
