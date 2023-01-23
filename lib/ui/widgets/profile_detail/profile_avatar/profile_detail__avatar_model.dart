import 'package:flutter/material.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/common/image_picker/image_picker.dart';
import 'package:race/domain/profile_detail/profile_detail_service.dart';
import 'package:race/entity/common/race_file.dart';

class ProfileDetailAvatarWWidgetModel extends ChangeNotifier {
  final _pickerService = ImagePickerService();
  final _profileService = ProfileDetailService();
  String _fileLogo = '';
  String get fileLogo => _fileLogo;
  RaceFile? _fileAvatar;
  RaceFile? get fileAvatar => _fileAvatar;

  Future<RaceFile?> getPictureFromCamera() async {
    try {
      final result = await _pickerService.getFromCamera();
      if (result != null && result.containsKey('raceFile')) {
        _fileAvatar = result['raceFile'] as RaceFile;
        _fileLogo = _fileAvatar!.file;
      }
      return _fileAvatar;
    } on ApiClientException catch (_) {
      return null;
    }
  }

  Future<RaceFile?> getPictureFromGallery() async {
    try {
      final result = await _pickerService.getFromGallery();
      if (result != null && result.containsKey('raceFile')) {
        _fileAvatar = result['raceFile'] as RaceFile;
        _fileLogo = _fileAvatar!.file;
      }
      return _fileAvatar;
    } on ApiClientException catch (_) {
      return null;
    }
  }

  Future<void> updateProfilePhoto(RaceFile file) async {
    _profileService.updateMeDetailProfile({'photo': file});
    _fileLogo = file.file;
    notifyListeners();
  }
}
