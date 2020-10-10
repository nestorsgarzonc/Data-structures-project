import 'package:ed_project/collections/linked_list.dart';
import 'package:test/test.dart';

void main() {
  final LinkedList lista = LinkedList();
  for (int i = 0; i < 100000000; i++) {
    lista.pushBack(i);
  }
  group('description', () {
    test('insert a value', () {
      expect(lista.topBack(), 100000000 - 1);
    });
    test('insert a value', () {
      expect(lista.topFront(), 0);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000);
    });
    test('insert a value', () {
      expect(lista.getValue(50000000), 50000000);
    });
    test('insert a value', () {
      lista.popFront();
      expect(lista.topFront(), 1);
    });
    test('insert a value', () {
      lista.popBack();
      expect(lista.topBack(), 100000000 - 2);
    });
    test('insert a value', () {
      expect(lista.getValue(50000000), 50000000 + 1);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000 - 2);
    });
    test('insert a value', () {
      expect(lista.remove(10000000), 10000000 + 1);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000 - 3);
    });
    test('insert a value', () {
      lista.pushFront(0);
      lista.pushFront(92);
      lista.pushFront(21);
      expect(lista.topFront(), 21);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000);
    });
    test('insert a value', () {
      expect(lista.getValue(50000000 + 1), 50000000);
    });
    test('insert a value', () {
      expect(lista.getValue(1), 92);
    });
    test('insert a value', () {
      expect(lista.getValue(0), 21);
    });
    test('insert a value', () {
      expect(lista.getValue(2), 0);
    });
    test('insert a value', () {
      expect(lista.find(100000000 - 2), true);
    });
    test('insert a value', () {
      expect(lista.find(100000000), false);
    });
    test('insert a value', () {
      expect(lista.find(1000000), true);
    });
    test('insert a value', () {
      expect(lista.indexOf(92), 1);
    });
    test('insert a value', () {
      expect(lista.indexOf(50000000), 50000000 + 1);
    });
    test('insert a value', () {
      lista.erase(50000000);
      expect(lista.getValue(50000000 + 1), 50000000 + 1);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000 - 1);
    });
    test('insert a value', () {
      expect(lista.find(50000000), false);
    });
    test('insert a value', () {
      expect(lista.isEmpty(), false);
    });
    test('insert a value', () {
      lista.add(50000000 + 1, 50);
      expect(lista.getValue(50000000 + 1), 50);
    });
    test('insert a value', () {
      expect(lista.size(), 100000000);
    });
    test('insert a value', () {
      expect(lista.getValue(50000000 + 2), 50000000 + 1);
    });
    test('insert a value', () {
      lista.makeEmpty();
      expect(lista.size(), 0);
    });
    test('insert a value', () {
      expect(lista.isEmpty(), true);
    });
    test('insert a value', () {
      lista.pushBack(15);
      lista.pushBack(2);
      expect(lista.toString(), "15\n2\n");
    });
  });
}
