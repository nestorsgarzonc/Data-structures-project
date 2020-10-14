import 'package:test/test.dart';

void main() {
  group('counter multiple invocatoins', () {
    test('contador', () {
      //Dado
      int value = 0;
      //Accion
      value = counter(value);
      //Espero
      expect(value, 1);
    });
    test('contador 1', () {
      //Dado
      int value = 0;
      //Accion
      value = counter(value);
      value = counter(value);
      //Espero
      expect(value, 2);
    });
    test('contador 2', () {
      //Dado
      int value = 0;
      //Accion
      value = counter(value);
      value = counter(value);
      value = counter(value);
      //Espero
      expect(value, 1);
    });
  });
}

int counter(int val) {
  return val + 2;
}
