import 'package:flutter_test/flutter_test.dart';
import 'package:waffly/providers/profile_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Unit tests about sign up', () {
    test('sign up with new user', () async {
      final profileProv = ProfileProvider();
      await profileProv.loadData();
      final res = profileProv.singUp('email', 'username', 'password');
      expect(res, true);
    });
    test('sign up with existent email', () async {
      final profileProv = ProfileProvider();
      await profileProv.loadData();
      final res = profileProv.singUp('gabymartinez@gmail.com', 'username', 'password');
      expect(res, false);
    });
    test('test regex with valid email', () async {
      const email = "tony@starkindustries.com";
      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);
      expect(emailValid, true);
    });
    test('test regex with invalid email', () async {
      const email = "tony@starkindustriem";
      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);
      expect(emailValid, false);
    });
    test('test regex with invalid email', () async {
      const email = "tonystarkindustriem";
      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);
      expect(emailValid, false);
    });
    test('test regex with invalid email', () async {
      const email = "tony@starkindustriem";
      final bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);
      expect(emailValid, false);
    });
  });
}
