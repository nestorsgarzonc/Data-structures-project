import 'package:test/test.dart';
import 'package:waffly/collections/node.dart';

void main() {
  group('description', () {
    test('insert a value', () {
      final Node node = Node(2);
      expect(node.value, 2);
    });
    test('insert a value', () {
      final Node node = Node(2);
      final Node node2 = Node(5);
      node.nextValue = node2;
      expect(node.nextValue.value, 5);
    });
  });
}
