import 'dart:convert';

import 'package:race/domain/api_client/api_client.dart';
import 'package:race/entity/profile/profile.dart';

class ProfileService extends ApiClient {
  Future<Profile> getMeProfile() async {
    final response = await getRequest("/users/api/v0/users/me/", null);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    final Profile result = Profile.fromJson(request);
    return result;
  }
}
