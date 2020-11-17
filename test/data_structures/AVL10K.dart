import 'package:waffly/collections/avl.dart';
import 'package:test/test.dart';

void main() {
  AVLTree bst = new AVLTree();
  group("Grupo de pruebas finales BST", () {
    test("Insercion de 10K numeros", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 10000; i++) {
        bst.insert(i);
      }
      print('Insert para 10k de datos en ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un numero en la raiz", () {
      int n = bst.root.value;
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.find(n);
      print('Find para el valor de la raiz: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un numero en un nivel intermedio", () {
      int n = (bst.root.value + 10000) ~/ 2;
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.find(n);
      print('Find para un elemento en la mitad: ${stopwatch.elapsedMicroseconds} microsegundos');
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
      print('Next para un elemento: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de los elementos etre 2 valores", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.search(0, 10000);
      print('Search para 2 valores: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Borrado de 1 valor", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      bst.delete(7500);
      print('Delete para 1 valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
  });
}
