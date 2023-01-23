import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/profile_detail/profile_detail_service.dart';
import 'package:race/entity/common/race_file.dart';
import 'package:race/entity/profile_detail/profile_detail.dart';

abstract class SkillPercentageByproficiency {
  static const double ninja = 100;
  static const double expert = 75;
  static const double proficient = 50;
  static const double novice = 25;

  static const Map<String, double> percentageList = {
    'ninja': 100,
    'expert': 75,
    'proficient': 50,
    'novice': 25
  };
}

class ProfileDetailWidgetModel extends ChangeNotifier {
  final _profileDetailService = ProfileDetailService();
  ProfileDetail? _profileMeDetail;
  ProfileDetail? get profileMeDetail => _profileMeDetail;
  bool _loading = false;
  bool get loading => _loading;
  String _shortName = '';
  String get shortName => _shortName;
  String _fileLogo = '';
  String get fileLogo => _fileLogo;
  RaceFile? _fileAvatar;
  RaceFile? get fileAvatar => _fileAvatar;

  ProfileDetailWidgetModel() {
    getMeDetailProfile();
  }

  Future<void> getMeDetailProfile() async {
    _loading = true;
    try {
      final result = await _profileDetailService.getMeDetailProfile();
      _profileMeDetail = result;
      _shortName =
          '${_profileMeDetail!.firstName[0]}${_profileMeDetail!.lastName[0]}'
              .toUpperCase();
      if (_profileMeDetail!.photo != null) {
        _fileLogo = await getImgUrl(_profileMeDetail!.photo!.file)
            ? _profileMeDetail!.photo!.file
            : '';
      }
      if (_profileMeDetail!.expertise != null) {
        for (ProfileExpertiseLanguage skill in _profileMeDetail!.expertise!) {
          skill.skillPercents = SkillPercentageByproficiency
              .percentageList[skill.proficiencyDisplay.toLowerCase()];
        }
      }
    } on ApiClientException catch (_) {}
    notifyListeners();
    _loading = false;
  }

  Future<bool> getImgUrl(String imgUrl) async {
    try {
      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
              .buffer
              .asUint8List();
      return true;
    } catch (_) {
      return false;
    }
  }
}
