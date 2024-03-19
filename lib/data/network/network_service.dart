import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService({required this.baseUrl});
  final String baseUrl;

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
