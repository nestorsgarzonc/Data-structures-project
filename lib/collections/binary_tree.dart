import 'dart:math';

import 'queue.dart';
import 'bt_node.dart';
import 'linked_list.dart';

class BinaryTree {
  BT_Node root;
  int height;

  BinaryTree() {
    root = null;
    height = 0;
  }

  BT_Node find(dynamic key, {BT_Node n}) {
    n ??= root;
    if (n.value == key) {
      return n;
    } else if (n.value > key) {
      if (n.leftChild == null) return n;
      return find(key, n: n.leftChild);
    } else {
      if (n.rightChild == null) return n;
      return find(key, n: n.rightChild);
    }
  }

  void insert(dynamic key) {
    if (root == null) {
      root = BT_Node(key);
      height = 0;
      return;
    }
    BT_Node n = find(key);
    if (n.value == key) {
      return;
    } else if (n.value > key) {
      n.leftChild = BT_Node(key, par: n);
      n = n.leftChild;
    } else {
      n.rightChild = BT_Node(key, par: n);
      n = n.rightChild;
    }
    if (n.parent.height == 1) heightDef(n.parent);
    balance(n);
  }

  void heightDef(BT_Node n) {
    if (n.leftChild != null && n.rightChild != null) {
      n.height = max(n.leftChild.height, n.rightChild.height) + 1;
    } else if (n.leftChild != null) {
      n.height = n.leftChild.height + 1;
    } else if (n.rightChild != null) {
      n.height = n.rightChild.height + 1;
    } else {
      n.height = 1;
    }
    if (n.parent == null) {
      height = n.height;
      return;
    }
    heightDef(n.parent);
  }

  /*int heightBalance(BT_Node n) {
    if (n == null) return 0;
    n.height = 1 + max(heightBalance(n.leftChild), heightBalance(n.rightChild));
    return n.height;
  }*/

  void balance(BT_Node n) {
    if ((n.leftChild != null) && (n.rightChild != null)) {
      if (n.leftChild.height > (n.rightChild.height + 1)) {
        rebalanceRight(n);
      } else if (n.rightChild.height > (n.leftChild.height + 1)) {
        rebalanceLeft(n);
      }
    } else if (n.leftChild != null && n.leftChild.height > 1) {
      rebalanceRight(n);
    } else {
      if (n.rightChild != null && n.rightChild.height > 1) {
        rebalanceLeft(n);
      }
    }
    heightDef(n);
    if (n.parent != null) balance(n.parent);
  }

  void rebalanceRight(BT_Node n) {
    final BT_Node m = n.leftChild;
    if (m.leftChild != null &&
        m.rightChild != null &&
        m.rightChild.height > m.leftChild.height) {
      rotateLeft(m);
    } else if (m.rightChild != null) rotateLeft(m);
    rotateRight(n);
  }

  void rebalanceLeft(BT_Node n) {
    BT_Node m = n.rightChild;
    if (m.leftChild != null && m.rightChild != null) if (m.leftChild.height >
        m.rightChild.height)
      rotateRight(m);
    else if (m.leftChild != null) rotateRight(m);
    rotateLeft(n);
  }

  void rotateRight(BT_Node n) {
    BT_Node aux = n.leftChild;
    n.leftChild = aux.rightChild;
    if (aux.rightChild != null) n.leftChild.parent = n;
    aux.rightChild = n;
    aux.parent = n.parent;
    if (n.parent == null)
      root = aux;
    else {
      if (n.parent.leftChild == n)
        n.parent.leftChild = aux;
      else
        n.parent.rightChild = aux;
    }
    n.parent = aux;
    heightDef(n);
  }

  void rotateLeft(BT_Node n) {
    BT_Node aux = n.rightChild;
    n.rightChild = aux.leftChild;
    if (aux.leftChild != null) n.rightChild.parent = n;
    aux.leftChild = n;
    aux.parent = n.parent;
    if (n.parent == null)
      root = aux;
    else {
      if (n.parent.leftChild == n)
        n.parent.leftChild = aux;
      else
        n.parent.rightChild = aux;
    }
    n.parent = aux;
    heightDef(n);
  }

  void delete(dynamic value) {
    BT_Node n = find(value);
    if (n.value != value) return;
    BT_Node s;
    if (n.rightChild == null) {
      s = n.parent;
      if (s.leftChild == n)
        s.leftChild = n.leftChild;
      else
        s.rightChild = n.leftChild;
      if (n.leftChild != null) n.leftChild.parent = s;
      heightDef(s);
      balance(s);
    } else {
      s = next(value);
      n.value = s.value;
      BT_Node x = s.parent;
      if (x.leftChild == s)
        x.leftChild = s.rightChild;
      else
        x.rightChild = s.rightChild;
      if (s.rightChild != null) s.rightChild.parent = x;
      heightDef(x);
      balance(x);
    }
  }

  BT_Node next(dynamic value) {
    BT_Node n = find(value);
    if (n.rightChild != null) {
      return leftDescendant(n.rightChild);
    } else {
      return rightAncestor(n);
    }
  }

  BT_Node leftDescendant(BT_Node n) {
    if (n.leftChild != null)
      return leftDescendant(n.leftChild);
    else
      return n;
  }

  BT_Node rightAncestor(BT_Node n) {
    if (n == root)
      return null;
    else if (n.value < n.parent.value)
      return n.parent;
    else
      return rightAncestor(n.parent);
  }

  LinkedList search(dynamic x, dynamic y) {
    LinkedList ans = LinkedList();
    if (x > y) {
      dynamic aux = x;
      x = y;
      y = aux;
    }
    BT_Node n = find(x);
    while (n.value <= y) {
      if (n.value >= x) ans.pushBack(n.value);
      n = next(n.value);
      if (n == null) break;
    }
    return ans;
  }

  String inOrder({BT_Node n = null}) {
    n ??= root;
    String ans = "";
    if (n.leftChild != null) {
      ans += inOrder(n: n.leftChild);
    }
    ans += '${n.value}\n';
    if (n.rightChild != null) {
      ans += inOrder(n: n.rightChild);
    }
    return ans;
  }

  void level() {
    final Queue s = Queue();
    BT_Node n = root;
    s.enqueue(n);
    while (!s.isEmpty()) {
      n = s.dequeue();
      print('${n.value}\t${n.height}');
      if (n.leftChild != null) s.enqueue(n.leftChild);
      if (n.rightChild != null) s.enqueue(n.rightChild);
    }
  }
}
