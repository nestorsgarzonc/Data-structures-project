import 'package:test/test.dart';
import 'package:waffly/collections/linked_list.dart';

void main() {
  final LinkedList lista = LinkedList();
  for (int i = 0; i < 100000000; i++) {
    lista.pushBack(i);
  }
  group('Testeo de la linkedlist', () {
    //Se obtiene el ultimo elemento luego de agregar los numeros del 0 a 99999999
    test('topback inicial', () {
      expect(lista.topBack(), 100000000 - 1);
    });
    //Se obtiene el primer elemento luego de agregar los numeros del 0 a 99999999
    test('topfront inicial', () {
      expect(lista.topFront(), 0);
    });
    //Se obtiene el tamaño luego de agregar los numeros del 0 a 99999999
    test('size inicial', () {
      expect(lista.size(), 100000000);
    });
    //Se obtiene el elemento en la posicion 50000000
    test('valor indice 50M', () {
      expect(lista.getValue(50000000), 50000000);
    });
    //Se elimina el primer elemento y se obtiene el nuevo primer elemento para probar la correcta eliminacion
    test('popFront y topFront para comprobar', () {
      lista.popFront();
      expect(lista.topFront(), 1);
    });
    //Se elimina el ultimo elemento y se obtiene el nuevo ultimo elemento para probar la correcta eliminacion
    test('popback y topback para comprobar', () {
      lista.popBack();
      expect(lista.topBack(), 100000000 - 2);
    });
    //Se obtiene el nuevo elemento en la posicion 50000000
    test('valor actual indice 50M', () {
      expect(lista.getValue(50000000), 50000000 + 1);
    });
    //Se obtiene el tamaño actual
    test('actual size', () {
      expect(lista.size(), 100000000 - 2);
    });
    //Se remueve el elemento de la posicion 10000000
    test('remove posicion 10000000', () {
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
