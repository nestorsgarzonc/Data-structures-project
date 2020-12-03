import 'package:test/test.dart';
import 'package:waffly/collections/set.dart';

void main() {
  Set x = Set();
  x.insert("key");
  x.insert("key1");
  x.insert("key2");
  x.insert("key3");
  x.insert("key4");
  x.insert(15);
  x.insert(25);
  x.insert(35);
  x.insert(45);
  x.insert(55);
  print(x);
  print(x.hasKey("key"));
  print(x.hasKey("key5"));
  print(x.hasKey(15));
  print(x.hasKey(5));
  x.remove("key");
  x.remove(15);
  print(x);
  print(x.size());
  test("ccw", () {
    expect(true, true);
  });
}
