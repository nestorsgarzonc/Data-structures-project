import 'package:ed_project/collections/avl.dart';
import 'package:test/test.dart';

void main() {
  AVLTree bst = new AVLTree();
  int d = 100000000;
  group("Grupo de pruebas finales BST", () {
    test("Insercion de 100M numeros", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < d; i++) {
        bst.insert(i);
      }
      print(
          'Insert para 100M de datos en ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un numero en la raiz", () {
      int n = bst.root.value;
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.find(n);
      print(
          'Find para el valor de la raiz: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un numero en un nivel intermedio", () {
      int n = (bst.root.value + d) ~/ 2;
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.find(n);
      print(
          'Find para un elemento en la mitad: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un numero en el ultimo nivel", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.find(0);
      print(
          'Find para un elemento en el ultimo nivel: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda del siguiente elemento de otro", () {
      int n = bst.root.value;
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.next(n);
      print(
          'Next para un elemento: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de los elementos etre 2 valores", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.search(0, d);
      print(
          'Search para 2 valores: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Borrado de 1 valor", () {
      int n = 75 * (d ~/ 100);
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.delete(n);
      print(
          'Delete para 1 valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
  });
}
