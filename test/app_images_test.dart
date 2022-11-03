import 'dart:io';

import 'package:race/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.background).existsSync(), true);
    expect(File(AppImages.bgLoader).existsSync(), true);
    expect(File(AppImages.loader).existsSync(), true);
    expect(File(AppImages.logo).existsSync(), true);
    expect(File(AppImages.raceLogo).existsSync(), true);
    expect(File(AppImages.raceLogoLoader).existsSync(), true);
    expect(File(AppImages.signIn).existsSync(), true);
  });
}
