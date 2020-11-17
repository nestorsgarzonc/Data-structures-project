import 'dart:math';

import 'package:test/test.dart';
import 'package:waffly/collections/avl.dart';
import 'package:waffly/collections/linked_list.dart';

void main() {
  final AVLTree bt = AVLTree();
  final LinkedList ll = LinkedList();
  final Random r = Random();
  int x;
  for (int i = 1; i <= 10; i++) {
    x = r.nextInt(100);
    bt.insert(x);
    ll.pushBack(x);
    bt.levelOrder();
    print('\n');
  }
  bt.inOrder();
  print('\n');
  print(ll.toString());
  print('\n');
  bt.delete(ll.getValue(4));
  bt.inOrder();
  print("\n");
  print(bt.search(30, 70));
  group("grupo 1", () {
    test('test 1', () {
      //lo que se quiere probar

      expect(true /*resultado*/, true /*esperado*/);
    });
    test('test 2', () {
      //cuerpo
      expect(null, null);
    });
  });
}
