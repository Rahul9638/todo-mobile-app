import 'dart:convert';

import 'package:http/http.dart';
import 'package:user_management/config/api_path/api_end_point.dart';
import 'package:user_management/data/model/response_modal/user_detail_response.dart';
import 'package:user_management/data/network/network_service.dart';

class UserRepository {
  final NetworkService networkService =
      NetworkService(baseUrl: ApiEndPoint.baseUrl);
  Future<List<UserDetailResponse>> getUsers() async {
    final Response response =
        await networkService.get(ApiEndPoint.userListEndPoint);
    final List<dynamic> decodedList =
        jsonDecode(response.body) as List<dynamic>;

    final List<UserDetailResponse> userDataList = decodedList
        .map((e) => UserDetailResponse.fromJson(e as Map<String, dynamic>))
        .toList();
    return userDataList;
  }
}
