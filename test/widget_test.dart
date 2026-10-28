import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('project uses readable naming conventions', () {
    expect(File('lib/models/category_model.dart').existsSync(), isTrue,
        reason: 'Category model file should be spelled consistently.');
    expect(File('lib/cubits/sign_up/states.dart').existsSync(), isTrue,
        reason: 'The sign-up cubit directory should use the correct naming.');
    expect(File('lib/screens/splash_screen.dart').existsSync(), isTrue,
        reason: 'The splash screen file should exist with the expected class naming.');
  });
}
