import 'package:waffly/collections/map.dart';
import 'package:test/test.dart';

void main() {
  Map mapa = new Map();
  group("Grupo de pruebas finales Map", () {
    test("Insercion de 100K pares", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      for (int i = 0; i < 100000; i++) {
        mapa.insert('Numero ${i}', i);
      }
      print(
          'Insert para 100k de pares en ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey('Numero 0');
      print('Find para un key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de otro key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey('Numero 50000');
      print(
          'Find para otro key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Busqueda de otro key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.hasKey('Numero 99999');
      print(
          'Find para otro key: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Cambio del valor de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.setValue('Numero 40000', 258600);
      print(
          'Cambio de un valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Obtener el valor de un key", () {
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.getValue('Numero 40000');
      print(
          'Obtener de un valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("Borrado de 1 valor", () {
      print(mapa.getValue('Numero 50000'));
      Stopwatch stopwatch = new Stopwatch()..start();
      mapa.remove('Numero 50000');
      print(
          'Delete para 1 valor: ${stopwatch.elapsedMicroseconds} microsegundos');
      expect(true, true);
    });
    test("has", () {
      expect(mapa.hasKey('Numero 50000'), false);
    });
    test("get", () {
      print(mapa.getValue('Numero 40000'));
      expect(mapa.getValue('Numero 40000'), 258600);
    });
    test("size", () {
      print(mapa.size());
      expect(mapa.size(), 99999);
    });
  });
}
