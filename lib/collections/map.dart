import 'package:waffly/collections/linked_list.dart';
import 'package:waffly/collections/node.dart';
import 'package:waffly/collections/pair.dart';

class Map {
  List<LinkedList> hashTable;
  int cardinality;

  Map() {
    cardinality = 1009;
    hashTable = new List(cardinality);
    for (int i = 0; i < cardinality; i++) {
      hashTable[i] = new LinkedList();
    }
  }

  int size() {
    int ans = 0;
    for (LinkedList i in hashTable) {
      ans += i.size();
    }
    return ans;
  }

  int hashing(dynamic key) {
    final a = 23;
    final b = 67;
    final p = 104729;
    int ans = (key.hashCode * a) % p;
    ans = ((ans + b) % p) % cardinality;
    return ans;
  }

  void rehash() {
    double carga = size() / cardinality;
    if (carga > 0.9) {
      cardinality *= 2;
      List<LinkedList> aux = hashTable;
      hashTable = new List(cardinality);
      for (int i = 0; i < cardinality; i++) {
        hashTable[i] = new LinkedList();
      }
      for (LinkedList i in aux) {
        Node n = i.getFirst();
        while (n != null) {
          insert(n.value.first, n.value.second);
          n = n.nextValue;
        }
      }
    }
  }

  void insert(dynamic key, dynamic value) {
    LinkedList l = hashTable[hashing(key)];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value.first == key) {
        return;
      }
      n = n.nextValue;
    }
    l.pushBack(Pair(key, value));
    rehash();
  }

  bool hasKey(dynamic key) {
    LinkedList l = hashTable[hashing(key)];
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
    LinkedList l = hashTable[hashing(key)];
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
    LinkedList l = hashTable[hashing(key)];
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
    LinkedList l = hashTable[hashing(key)];
    l.removeWhere((x) => x.first == key);
  }

  @override
  String toString() {
    String ans = "";
    for (LinkedList i in hashTable) {
      Node n = i.getFirst();
      while (n != null) {
        ans += "${n.value.first}: ${n.value.second}\n";
        n = n.nextValue;
      }
    }
    return ans;
  }
}
