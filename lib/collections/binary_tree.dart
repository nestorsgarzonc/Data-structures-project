import 'dart:math';
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
    if (n.parent.height == 1) heightDef(root);
    balance(n);
  }

  int heightDef(BT_Node n) {
    if (n == null) return 0;
    n.height = 1 + max(heightDef(n.leftChild), heightDef(n.rightChild));
    return n.height;
  }

  void balance(BT_Node n) {}

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
    } else {
      s = next(value);
      n.value = s.value;
      BT_Node x = s.parent;
      if (x.leftChild == s)
        x.leftChild = s.rightChild;
      else
        x.rightChild = s.rightChild;
    }
    heightDef(root);
    balance(root);
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

  void inOrder({BT_Node n = null}) {
    if (n == null) n = root;
    if (n.leftChild != null) inOrder(n: n.leftChild);
    print('${n.value}\t${n.height}');
    if (n.rightChild != null) inOrder(n: n.rightChild);
  }
}
