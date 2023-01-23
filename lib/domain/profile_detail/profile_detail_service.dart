import 'dart:convert';

import 'package:race/domain/api_client/api_client.dart';
import 'package:race/entity/profile_detail/profile_detail.dart';

class ProfileDetailService extends ApiClient {
  Future<ProfileDetail> getMeDetailProfile() async {
    final response = await getRequest("/profiles/api/v0/profiles/me/", null);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    final ProfileDetail result = ProfileDetail.fromJson(request);
    return result;
  }

  Future<Map<String, dynamic>> updateMeDetailProfile(Map<String, dynamic> params) async {
    final request = await makeRequest('patch', "/profiles/api/v0/profiles/me/", params, {'fields': 'photo'});
    final Map<String, dynamic> result = request as Map<String, dynamic>;
    return result;
  }
}
