import 'package:waffly/collections/map.dart';
import 'package:test/test.dart';

void main() {
  Map mapa = new Map();
  group("Grupo de pruebas finales Map", () {
    test("Insercion de 10M pares", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 10000000; i++) {
        mapa.insert(i, 'Numero ${i}');
      }
      print(
          'Insert para 10M de pares en ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey(0);
      print('Find para un key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de otro key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey(5000000);
      print(
          'Find para otro key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de otro key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey(9999999);
      print(
          'Find para otro key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Cambio del valor de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.setValue(4000000, 'Numero 25860000');
      print(
          'Cambio de un valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Obtener el valor de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.getValue(4000000);
      print(
          'Obtener de un valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Borrado de 1 valor", () {
      print(mapa.getValue(5000000));
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.remove(5000000);
      print(
          'Delete para 1 valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("has", () {
      expect(mapa.hasKey(5000000), false);
    });
    test("get", () {
      print(mapa.getValue(4000000));
      expect(mapa.getValue(4000000), 'Numero 25860000');
    });
    test("size", () {
      print(mapa.size());
      expect(mapa.size(), 9999999);
    });
  });
}
