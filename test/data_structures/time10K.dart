import 'package:ed_project/collections/linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LinkedList lista = LinkedList();
  group("Tomas de tiempo para 10K de datos", () {
    test("PushBack10K", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 8191; i++) {
        lista.pushBack(i);
      }
      print(
          'PushBack para 10K de datos en ${stopwatch.elapsedMicroseconds} milisegundos');
      expect(true, true);
    });
    test("PopBack", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.popBack();
      print(
          'PopBack en una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      lista.pushBack(9999);
      expect(true, true);
    });
    test("find 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(0);
      print(
          'Find para un elemento al inicio de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("find 4999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(4999);
      print(
          'Find para un elemento en el centro de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("find 9999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.find(9999);
      print(
          'Find para un elemento al final de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("erase 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(0);
      print(
          'Erase para un elemento al inicio de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("erase 4999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(4999);
      print(
          'Erase para un elemento en el centro de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("Erase 9999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.erase(9999);
      print(
          'Erase para un elemento al final de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("add 0 en 0", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(0, 0);
      print(
          'Agregar un elemento al inicio de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("add 4999 en 4999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(4999, 4999);
      print(
          'Agregar un  elemento en el centro de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
    test("add 9999 en 9999", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      lista.add(9999, 9999);
      print(
          'Agregar un  elemento al final de una lista de 10K de datos en ${stopwatch.elapsedMilliseconds} milisegundos');
      expect(true, true);
    });
  });
}
