import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/domain/profile/profile_service.dart';
import 'package:race/entity/profile/profile.dart';

class ProfileWidgetModel extends ChangeNotifier {
  final _profileService = ProfileService();
  final _sessionDataProvider = SessionDataProvider();
  Profile? _profileMe;
  Profile? get profile => _profileMe;
  String _shortName = '';
  String get shortName => _shortName;
  bool _loading = false;
  bool get loading => _loading;
  bool _isImg = false;
  bool get isImg => _isImg;


  ProfileWidgetModel() {
    getProfile();
  }

  Future<void> getProfile() async {
    _loading = true;
    try {
      final result = await _profileService.getMeProfile();
      _profileMe = result;
      await _sessionDataProvider.setManagerid(_profileMe!.id.toString());
      if (_profileMe!.profile!.photo !=null) {
        _isImg = await getImgUrl(_profileMe!.profile!.photo!.file);
      }
      _shortName = '${_profileMe!.profile!.firstName![0]}${_profileMe!.profile!.lastName![0]}'.toUpperCase();
    } on ApiClientException catch (_) {}
    _loading = false;
    notifyListeners();
  }

  Future<bool> getImgUrl(String imgUrl) async {
    try {
      Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl)).buffer.asUint8List();
      return true;
    } catch (_) {
      return false;
    }
  }
}
