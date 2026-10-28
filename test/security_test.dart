import 'package:creative_shop/models/sign_up_model.dart';
import 'package:creative_shop/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('safe profile excludes password before storage', () {
    final user = SignUpModel(
      username: 'Alice',
      email: 'alice@example.com',
      password: 'super-secret-password',
    );

    final safeProfile = AuthRepository.toProfile(user);

    expect(safeProfile['username'], 'Alice');
    expect(safeProfile['email'], 'alice@example.com');
    expect(safeProfile.containsKey('password'), isFalse);
  });
}
