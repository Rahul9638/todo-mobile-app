// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  // final Dio dio = Dio();
  final String baseUrl;
  // final CustomInterceptors interceptors = CustomInterceptors();

  NetworkService({required this.baseUrl});
  // Future<Response> get(String path,
  //     {Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response = await dio.get(
  //       baseUrl + path,
  //       queryParameters: queryParameters,
  //     );
  //     return response;
  //   } catch (e) {
  //     print('the error is $e');
  //     throw Exception();
  //   }
  // }

  // Future<Response> post(String path,
  //     {required Map<String, dynamic> data}) async {
  //   try {
  //     final response = await dio.post(
  //       baseUrl + path,
  //       data: data,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception();
  //   }
  // }

  // Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
  //   try {
  //     final response = await dio.delete(
  //       baseUrl + path,
  //       data: data,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception();
  //   }
  // }

  // Future<Response> update(String path, Map<String, dynamic> data) async {
  //   try {
  //     final response = await dio.put(
  //       baseUrl + path,
  //       data: data,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception();
  //   }
  // }
  Future<http.Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final http.Response response = await http.get(Uri.parse(baseUrl + path));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception();
    }
  }

  Future<http.Response> post(String path,
      {required Map<String, dynamic> data}) async {
    final http.Response response =
        await http.post(Uri.parse(baseUrl + path), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception();
    }
  }
}
