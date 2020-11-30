import 'package:test/test.dart';
import 'package:waffly/collections/map.dart';

void main() {
  Map x = Map();
  x.insert("key", 15);
  x.insert("key1", 25);
  x.insert("key2", 35);
  x.insert("key3", 45);
  x.insert("key4", 55);
  x.insert(15, "key");
  x.insert(25, "key1");
  x.insert(35, "key2");
  x.insert(45, "key3");
  x.insert(55, "key4");
  print(x);
  print(x.hasKey("key"));
  print(x.hasKey("key5"));
  print(x.hasKey(15));
  print(x.hasKey(5));
  print(x.getValue("key"));
  print(x.getValue("key5"));
  print(x.getValue(15));
  print(x.getValue(5));
  x.setValue("key", 10);
  x.setValue(15, "Nkey");
  print(x);
  print(x.size());
  x.remove("key");
  x.remove(15);
  print(x);
  print(x.size());
  test("ccw", () {
    expect(true, true);
  });
}
