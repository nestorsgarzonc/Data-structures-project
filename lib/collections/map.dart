import 'dart:collection';

import 'package:waffly/collections/linked_list.dart';
import 'package:waffly/collections/node.dart';
import 'package:waffly/collections/pair.dart';

class Map {
  List<LinkedList> hashTable;
  int cardinality;
  int i = 0;

  Map() {
    cardinality = 10000007;
    hashTable = new List(cardinality);
  }

  int size() {
    int ans = 0;
    for (LinkedList i in hashTable) {
      if (i != null) ans += i.size();
    }
    return ans;
  }

  int hashing(dynamic key) {
    final a = 23;
    final b = 67;
    final p = 100000019;
    int ans = (key.hashCode * a) % p;
    ans = ((ans + b) % p) % cardinality;
    return ans;
  }

  void insert(dynamic key, dynamic value) {
    int h = hashing(key);
    LinkedList l =
        (hashTable[h] == null) ? hashTable[h] = LinkedList() : hashTable[h];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value.first == key) {
        return;
      }
      n = n.nextValue;
    }
    l.pushBack(Pair(key, value));
    i++;
    if (i % 10000000 == 0) print(i);
  }

  bool hasKey(dynamic key) {
    int h = hashing(key);
    LinkedList l =
        (hashTable[h] == null) ? hashTable[h] = LinkedList() : hashTable[h];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value.first == key) {
        return true;
      }
      n = n.nextValue;
    }
    return false;
  }

  dynamic getValue(dynamic key) {
    int h = hashing(key);
    LinkedList l =
        (hashTable[h] == null) ? hashTable[h] = LinkedList() : hashTable[h];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value.first == key) {
        return n.value.second;
      }
      n = n.nextValue;
    }
    return null;
  }

  void setValue(dynamic key, dynamic value) {
    int h = hashing(key);
    LinkedList l =
        (hashTable[h] == null) ? hashTable[h] = LinkedList() : hashTable[h];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value.first == key) {
        n.value.second = value;
        return;
      }
      n = n.nextValue;
    }
    l.pushBack(Pair(key, value));
  }

  void remove(dynamic key) {
    int h = hashing(key);
    LinkedList l = hashTable[h];
    if (hashTable[h] == null) {
      hashTable[h] = LinkedList();
      l = hashTable[h];
    }
    l.removeWhere((x) => x.first == key);
  }

  @override
  String toString() {
    String ans = "";
    for (LinkedList i in hashTable) {
      Node n = (i == null) ? null : i.getFirst();
      while (n != null) {
        ans += "${n.value.first}: ${n.value.second}\n";
        n = n.nextValue;
      }
    }
    return ans;
  }
}
