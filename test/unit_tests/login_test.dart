import 'package:ed_project/providers/profile_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Login testing', () {
    test('Login with correct email', () async {
      final a = ProfileProvider();
      await a.loadData();
      final result = a.login('luisagarzon@gmail.com', 'sdfdsg');
      expect(result, true);
    });

    test('Login with invalid email', () async {
      final a = ProfileProvider();
      await a.loadData();

      final result = a.login('lusarzon@gmail.com', '24erd');
      expect(result, false);
    });

    test('Login with invalid password', () async {
      final a = ProfileProvider();
      await a.loadData();
      final result = a.login('gabymartinez@gmail.com', '24erd');
      expect(result, false);
    });

    test('Login with valid email', () async {
      final a = ProfileProvider();
      await a.loadData();
      final result = a.login('jmoreno1@gmail.com', 'n4SbDnJ');
      expect(result, true);
    });

    test('Login with valid email and check properties', () async {
      final a = ProfileProvider();
      await a.loadData();
      a.login('jmoreno1@gmail.com', 'n4SbDnJ');
      final user = a.getUser;
      expect(user.lastName, 'Moreno');
    });
  });
}
