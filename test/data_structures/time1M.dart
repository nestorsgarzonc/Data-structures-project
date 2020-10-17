import 'package:ed_project/collections/linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LinkedList lista = LinkedList();
  group("Tomas de tiempo para 1M de datos", () {
    test("PushBack1M", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 1000000; i++) {
        lista.pushBack(i);
      }
      print('PushBack para 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("PopBack", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.popBack();
      print(
          'PopBack en una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      lista.pushBack(999999);
      expect(true, true);
    });
    test("find 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(0);
      print(
          'Find para un elemento al inicio de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("find 499999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(499999);
      print(
          'Find para un elemento en el centro de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("find 999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(999999);
      print(
          'Find para un elemento al final de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("erase 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(0);
      print(
          'Erase para un elemento al inicio de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("erase 499999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(499999);
      print(
          'Erase para un elemento en el centro de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("Erase 999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(999999);
      print(
          'Erase para un elemento al final de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 0 en 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(0, 0);
      print(
          'Agregar un elemento al inicio de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 499999 en 499999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(499999, 499999);
      print(
          'Agregar un  elemento en el centro de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
    test("add 999999 en 999999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(999999, 999999);
      print(
          'Agregar un  elemento al final de una lista de 1M de datos en ${stopwatch.elapsedMilliseconds}');
      expect(true, true);
    });
  });
}
