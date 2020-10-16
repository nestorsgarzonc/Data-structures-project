import 'package:ed_project/models/profile_model.dart';
import 'package:ed_project/providers/profile_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Test for update an user', () {
    test('Update an existing user', () async {
      final uProv = ProfileProvider();
      await uProv.loadData();
      uProv.login('gabymartinez@gmail.com', 'sdfdsg');
      final userP = uProv.getUser;
      final ProfileModel user = userP;
      user.name = 'Alfonso';
      user.lastName = 'PTE';
      final bool response = uProv.updateUser(user);
      expect(response, true);
    });

    test('Update an existing user checking their attributes', () async {
      final uProv = ProfileProvider();
      await uProv.loadData();
      uProv.login('gabymartinez@gmail.com', 'sdfdsg');
      final userP = uProv.getUser;
      final ProfileModel user = userP;
      user.name = 'Alfonso';
      user.lastName = 'PTE';
      uProv.updateUser(user);
      expect(user.name, uProv.getUser.name);
    });
  });
}
