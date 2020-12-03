import 'package:waffly/collections/linked_list.dart';
import 'package:waffly/collections/node.dart';

class Set {
  List<LinkedList> hashTable;
  int cardinality;

  Set() {
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
          insert(n.value);
          n = n.nextValue;
        }
      }
    }
  }

  void insert(dynamic key) {
    LinkedList l = hashTable[hashing(key)];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value == key) {
        return;
      }
      n = n.nextValue;
    }
    l.pushBack(key);
    rehash();
  }

  bool hasKey(dynamic key) {
    LinkedList l = hashTable[hashing(key)];
    Node n = l.getFirst();
    while (n != null) {
      if (n.value == key) {
        return true;
      }
      n = n.nextValue;
    }
    return false;
  }

  void remove(dynamic key) {
    LinkedList l = hashTable[hashing(key)];
    l.removeWhere((x) => x == key);
  }

  @override
  String toString() {
    String ans = "";
    for (LinkedList i in hashTable) {
      Node n = i.getFirst();
      while (n != null) {
        ans += "${n.value}\n";
        n = n.nextValue;
      }
    }
    return ans;
  }
}
