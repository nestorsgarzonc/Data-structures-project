import 'package:flutter_test/flutter_test.dart';
import 'package:waffly/providers/profile_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Test for delete user', () {
    test('Delete an existing user', () async {
      final uProv = ProfileProvider();
      await uProv.loadData();
      uProv.login('gabymartinez@gmail.com', 'sdfdsg');
      final bool response = uProv.deleteUser();
      expect(response, true);
    });

    test('Delete a no valid user', () async {
      final uProv = ProfileProvider();
      await uProv.loadData();
      //NOTE: If the user doesnt exist the user is null
      uProv.login('zon@gmail.com', 'sdfdsg');
      final response = uProv.deleteUser();
      expect(response, false);
    });
  });
}
