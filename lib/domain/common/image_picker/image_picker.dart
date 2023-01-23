import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/entity/common/race_file.dart';
import 'dart:math';
import 'package:mime/mime.dart';

class ImagePickerService extends ApiClient {
  final ImagePicker _picker = ImagePicker();
  final String _saveFileUrl = '/files/api/v0/files/';

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<Map<String, dynamic>?> getFromCamera() async {
    XFile imageFile;
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      final raceFile = await uploadFile(imageFile);
      return {'raceFile': raceFile, 'xFile': imageFile};
    } else {
      return null;
    }
  }

    Future<Map<String, dynamic>?> getFromGallery() async {
    XFile imageFile;
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      final raceFile = await uploadFile(imageFile);
      return {'raceFile': raceFile, 'xFile': imageFile};
    } else {
      return null;
    }
  }

  Future<void> getLostData() async {
  final LostDataResponse response =
      await _picker.retrieveLostData();
  if (response.isEmpty) {
    return;
  }
  if (response.files != null) {
    response.files;
    for (final XFile file in response.files as List<XFile>) {
      print(file);
    }
  } else {
    print('exeption');
  }
}

  Future<RaceFile> uploadFile(XFile file) async {
    final String mimeType = lookupMimeType(file.path)!.split('/').last;
    String fileName = '${DateFormat.yM().format(DateTime.now())}-${getRandomString(10)}';

    final bodyParameters = {
      'name': fileName,
      'title': '$fileName.$mimeType',
      'file': file
    };
    final request = await uploadFileToServer(_saveFileUrl, bodyParameters);
    final RaceFile result = RaceFile.fromJson(request);
    return result;
  }
}
