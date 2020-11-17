import 'dart:math';
import './avlnode.dart';
import './linked_list.dart';
import './queue.dart';
import './stack.dart';

class AVLTree {
  int variable = 0;
  AVLNode root;
  int height;

  AVLTree() {
    root = null;
    height = 0;
  }

  void insert(dynamic value) {
    root = _insert(value, root);
    height = root.height;
  }

  AVLNode _insert(dynamic value, AVLNode node) {
    if (node == null) {
      return AVLNode(value);
    } else {
      int resultCompare = node.value.compareTo(value);
      variable = resultCompare;
      if (resultCompare == 1) {
        node.leftSon = _insert(value, node.leftSon);
        if (node.rightSon != null) {
          node.height = max(node.rightSon.height, node.leftSon.height) + 1;
          if (node.leftSon.height > node.rightSon.height + 1) {
            if (variable == 1) {
              node = SingleRotationR(node);
            } else {
              node = DoubleRotationRL(node);
            }
          }
        } else {
          node.height = node.leftSon.height + 1;
          if (node.leftSon.height > 0) {
            if (variable == 1) {
              node = SingleRotationR(node);
            } else {
              node = DoubleRotationRL(node);
            }
          }
        }
        //print(resultCompare);
      } // > - 1
      else if (resultCompare == -1) {
        node.rightSon = _insert(value, node.rightSon);
        if (node.leftSon != null) {
          node.height = max(node.rightSon.height, node.leftSon.height) + 1;
          if (node.rightSon.height > node.leftSon.height + 1) {
            if (variable == -1) {
              node = SingleRotationL(node);
            } else {
              node = DoubleRotationLR(node);
            }
          }
        } else {
          node.height = node.rightSon.height + 1;
          if (node.rightSon.height > 0) {
            if (variable == -1) {
              node = SingleRotationL(node);
            } else {
              node = DoubleRotationLR(node);
            }
          }
        }
        //print(resultCompare);
      } // < -1
      return node; // == 0
    }
  }

  void levelOrder() {
    Queue myQueue = Queue();
    AVLNode aux;
    myQueue.enqueue(root);
    while (!myQueue.isEmpty()) {
      aux = myQueue.dequeue();
      print("${aux.value}:${aux.height}");
      if (aux.leftSon != null) {
        myQueue.enqueue(aux.leftSon);
      }
      if (aux.rightSon != null) {
        myQueue.enqueue(aux.rightSon);
      }
    }
  }

  void preOrden(AVLNode root) {
    if (root != null) {
      print(root.value + " ,");
      preOrden(root.leftSon);
      preOrden(root.rightSon);
    }
  }

  int heightNode(AVLNode node) {
    if (node == null)
      return -1;
    else
      return node.height;
  }

  int getBalance(AVLNode node) {
    if (node == null) return 0;
    return heightNode(node.leftSon) - heightNode(node.rightSon);
  }

  void delete(dynamic value) {
    root = _delete(value, root);
  }

  AVLNode _delete(dynamic value, AVLNode node) {
    if (node == null) return null;
    int resultCompare = node.value.compareTo(value);
// -1 -> node.value < value
    // 1 -> node.value > value
    // 0 ->node.value == value
    if (resultCompare > 0) {
      node.leftSon = _delete(value, node.leftSon);
    } else if (resultCompare < 0) {
      node.rightSon = _delete(value, node.rightSon);
    } else if (node.leftSon != null && node.rightSon != null) {
      AVLNode pred = _findMin(node.rightSon);
      // Si alguien lo quiere hacer con el sucesor
      //AVLNode suce = findMin(node.rightSon):
      node.value = pred.value;
      node.rightSon = _delete(pred.value, node.rightSon);
    } else {
      node = (node.leftSon != null) ? node.leftSon : node.rightSon;
      // condicion booleana ? (cond true) (cond false)
      return node;
    }
    node.height = 1 + max(heightNode(node.leftSon), heightNode(node.rightSon));
    int balance = getBalance(node);
    if (balance > 1 && getBalance(node.leftSon) >= 0) return SingleRotationR(node);
    if (balance > 1 && getBalance(node.leftSon) < 0) {
      node.leftSon = SingleRotationL(node.leftSon);
      return SingleRotationR(node);
    }
    if (balance < -1 && getBalance(node.rightSon) <= 0) return SingleRotationL(node);
    if (balance < -1 && getBalance(node.rightSon) > 0) {
      node.rightSon = SingleRotationR(node.rightSon);
      return SingleRotationL(node);
    }
    return node;
  }

  dynamic findMin() {
    return _findMin(root).value;
  }

  AVLNode _findMin(AVLNode node) {
    if (node.leftSon == null)
      return node;
    else
      return _findMin(node.leftSon);
  }

  dynamic findMax() {
    return _findMax(root).value;
  }

  AVLNode _findMax(AVLNode node) {
    if (node.rightSon == null)
      return node;
    else
      return _findMax(node.rightSon);
  }

  /*AVLNode balance(AVLNode node) {
    if (node == null) return null;
    if (node.leftSon != null && node.rightSon != null) {
      if (node.leftSon.height > node.rightSon.height + 1) {
        if (node.leftSon.leftSon != null && node.leftSon.rightSon != null) {
          if (node.leftSon.leftSon.height > node.leftSon.rightSon.height) {
            node = SingleRotationL(node);
          } else if (node.leftSon.rightSon.height >
              node.leftSon.leftSon.height) {
            node = DoubleRotationLR(node);
          }
        }else
        } else if (node.rightSon.height > node.leftSon.height + 1) {
          if (node.rightSon.leftSon.height > node.rightSon.rightSon.height) {
            node = SingleRotationR(node);
          } else if (node.rightSon.rightSon.height >
              node.rightSon.leftSon.height) {
            node = DoubleRotationRL(node);
          }
      } else {
        node.rightSon = balance(node.leftSon);
        node.leftSon = balance(node.leftSon);
      }
    }
  }*/

  AVLNode SingleRotationR(AVLNode node) {
    AVLNode tmp = node.leftSon;
    node.leftSon = tmp.rightSon;
    if (node.leftSon != null && node.rightSon != null) {
      node.height = max(node.rightSon.height, node.leftSon.height) + 1;
    } else if (node.leftSon != null) {
      node.height = node.leftSon.height + 1;
    } else if (node.rightSon != null) {
      node.height = node.rightSon.height + 1;
    } else
      node.height = 0;
    tmp.rightSon = node;
    if (tmp.leftSon != null) {
      tmp.height = max(tmp.rightSon.height, tmp.leftSon.height) + 1;
    } else {
      tmp.height = tmp.rightSon.height + 1;
    }
    return tmp;
  }

  AVLNode SingleRotationL(AVLNode node) {
    AVLNode tmp = node.rightSon;
    node.rightSon = tmp.leftSon;
    if (node.leftSon != null && node.rightSon != null) {
      node.height = max(node.rightSon.height, node.leftSon.height) + 1;
    } else if (node.leftSon != null) {
      node.height = node.leftSon.height + 1;
    } else if (node.rightSon != null) {
      node.height = node.rightSon.height + 1;
    } else
      node.height = 0;
    tmp.leftSon = node;
    if (tmp.rightSon != null) {
      tmp.height = max(tmp.rightSon.height, tmp.leftSon.height) + 1;
    } else {
      tmp.height = tmp.leftSon.height + 1;
    }
    return tmp;
  }

  AVLNode DoubleRotationLR(AVLNode node) {
    node.rightSon = SingleRotationR(node.rightSon);
    node = SingleRotationL(node);
    return node;
  }

  AVLNode DoubleRotationRL(AVLNode node) {
    node.leftSon = SingleRotationL(node.leftSon);
    node = SingleRotationR(node);
    return node;
  }

  void makeEmpty() {
    root = null;
  }

  bool isEmpty() {
    return root == null;
  }

  void inOrder({AVLNode n = null}) {
    if (n == null) n = root;
    if (n.leftSon != null) inOrder(n: n.leftSon);
    print('${n.value}\t${n.height}');
    if (n.rightSon != null) inOrder(n: n.rightSon);
  }

  LinkedList search(dynamic x, dynamic y) {
    LinkedList ans = LinkedList();
    if (x > y) {
      dynamic aux = x;
      x = y;
      y = aux;
    }
    AVLNode n = find(x);
    while (n.value <= y) {
      if (n.value >= x) ans.pushBack(n.value);
      n = next(n.value);
      if (n == null) break;
    }
    return ans;
  }

  AVLNode find(dynamic key, {AVLNode n = null}) {
    if (n == null) n = root;
    if (n.value == key)
      return n;
    else if (n.value > key) {
      if (n.leftSon == null) return n;
      return find(key, n: n.leftSon);
    } else {
      if (n.rightSon == null) return n;
      return find(key, n: n.rightSon);
    }
  }

  AVLNode next(dynamic value) {
    AVLNode n = find(value);
    if (n.rightSon != null) {
      return leftDescendant(n.rightSon);
    } else {
      return rightAncestor(n);
    }
  }

  AVLNode leftDescendant(AVLNode n) {
    if (n.leftSon != null)
      return leftDescendant(n.leftSon);
    else
      return n;
  }

  AVLNode rightAncestor(AVLNode n) {
    AVLNode s = root;
    Stack pila = Stack();
    while (s != n) {
      pila.push(s);
      if (s.value > n.value)
        s = s.leftSon;
      else
        s = s.rightSon;
    }
    while (pila.size() > 0) {
      s = pila.pop();
      if (s.value > n.value) break;
      if (s == root) s = null;
    }
    return s;
  }
  //4 Métodos para recorrer el arbol
}
