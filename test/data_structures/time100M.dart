import 'package:ed_project/collections/linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LinkedList lista = LinkedList();
  group("Tomas de tiempos para 100M de datos", () {
    test("PushBack100M", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 100000000; i++) {
        lista.pushBack(i);
      }
      print('PushBack para 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("PopBack", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.popBack();
      print(
          'PopBack en una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      lista.pushBack(99999999);
      expect(true, true);
    });
    test("find 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(0);
      print(
          'Find para un elemento al inicio de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("find 49999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(49999999);
      print(
          'Find para un elemento en el centro de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("find 99999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(99999999);
      print(
          'Find para un elemento al final de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("erase 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(0);
      print(
          'Erase para un elemento al inicio de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("erase 49999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(49999999);
      print(
          'Erase para un elemento en el centro de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("Erase 99999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(99999999);
      print(
          'Erase para un elemento al final de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 0 en 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(0, 0);
      print(
          'Agregar un elemento al inicio de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 49999999 en 49999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(49999999, 49999999);
      print(
          'Agregar un  elemento en el centro de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 99999999 en 99999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(99999999, 99999999);
      print(
          'Agregar un  elemento al final de una lista de 100M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
  });
}
