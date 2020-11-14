import '../../lib/collections/linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LinkedList lista = LinkedList();
  group("Tomas de tiempo para 100K de datos", () {
    test("PushBack100K", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 100000; i++) {
        lista.pushBack(i);
      }
      print('PushBack para 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("PopBack", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.popBack();
      print(
          'PopBack en una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      lista.pushBack(99999);
      expect(true, true);
    });
  });
  test("find 0", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.find(0);
    print(
        'Find para un elemento al inicio de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("find 49999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.find(49999);
    print(
        'Find para un elemento en el centro de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("find 99999999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.find(99999);
    print(
        'Find para un elemento al final de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("erase 0", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.erase(0);
    print(
        'Erase para un elemento al inicio de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("erase 49999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.erase(49999);
    print(
        'Erase para un elemento en el centro de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("Erase 99999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.erase(99999);
    print(
        'Erase para un elemento al final de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("add 0 en 0", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.add(0, 0);
    print(
        'Agregar un elemento al inicio de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("add 49999 en 49999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.add(49999, 49999);
    print(
        'Agregar un  elemento en el centro de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
  test("add 99999 en 99999", () {
    Stopwatch stopwatch = new Stopwatch()..start();
    lista.add(99999, 99999);
    print(
        'Agregar un  elemento al final de una lista de 100K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
    expect(true, true);
  });
}
