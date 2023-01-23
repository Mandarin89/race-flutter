import 'dart:io';

import 'package:race/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.background).existsSync(), true);
    expect(File(AppImages.bgLoader).existsSync(), true);
    expect(File(AppImages.loader).existsSync(), true);
    expect(File(AppImages.logo).existsSync(), true);
    expect(File(AppImages.noteGreen).existsSync(), true);
    expect(File(AppImages.pendingApproval).existsSync(), true);
    expect(File(AppImages.raceLogo).existsSync(), true);
    expect(File(AppImages.raceLogoLoader).existsSync(), true);
    expect(File(AppImages.signIn).existsSync(), true);
    expect(File(AppImages.submission).existsSync(), true);
    expect(File(AppImages.taskEnd).existsSync(), true);
    expect(File(AppImages.taskStatus).existsSync(), true);
    expect(File(AppImages.warning).existsSync(), true);
    expect(File(AppImages.galleryPhoto).existsSync(), true);
    expect(File(AppImages.pencilEdit).existsSync(), true);
    expect(File(AppImages.photoCamera).existsSync(), true);
    expect(File(AppImages.plus).existsSync(), true);
  });
}
