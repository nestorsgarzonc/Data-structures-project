import 'package:ed_project/collections/node.dart';

class LinkedList {
  Node head;
  Node tail;
  int size;

  LinkedList() {
    head = null;
    size = 0;
    tail = null;
  }

  void pushFront(dynamic key) {
    if (head == null) {
      head = Node(key);
      tail = Node(key);
    } else {
      final Node n = Node(key);
      n.nextValue = head;
      head = n;
    }
    size++;
  }

  dynamic topFront() {
    return head.value;
  }

  void popFront() {
    if (size == 0) return;
    head = head.nextValue;
    size--;
  }

  void pushBack(dynamic key) {
    if (head == null) {
      head = Node(key);
      tail = Node(key);
    } else {
      final Node n = Node(key);
      tail.nextValue = n;
      tail = n;
    }
    size++;
  }

  dynamic topBack() {
    return tail.value;
  }

  void popBack() {
    if (size == 0) return;
    if (size == 1) {
      head = null;
      tail = null;
    } else {
      Node n = head;
      while (n.nextValue.nextValue != null) {
        n = n.nextValue;
      }
      n.nextValue = null;
      tail = n;
    }
    size--;
  }

  bool find(dynamic key) {
    Node n = head;
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
}
