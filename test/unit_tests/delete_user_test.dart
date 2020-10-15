import 'package:ed_project/providers/profile_provider.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Test for delete user', () {
    test('Delete an existing user', () async {
      var uProv = ProfileProvider();
      await uProv.loadData();
      uProv.login('gabymartinez@gmail.com', 'sdfdsg');
      bool response = uProv.deleteUser();
      expect(response, true);
    });

    test('Delete a no valid user', ()  async{
      final uProv = ProfileProvider();
      await uProv.loadData();
      //NOTE: If the user doesnt exist the user is null
      uProv.login('zon@gmail.com', 'sdfdsg');
      final response = uProv.deleteUser();
      expect(response, false);
    });
  });
}
