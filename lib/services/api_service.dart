import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.16.20.8:8000/api',
        connectTimeout: const Duration(seconds: 10),
        headers: {"Accept": "application/json"},
      ),
    );
  }

  // EQUIPMENTS
  Future<List> getEquipments() async {
    final response = await _dio.get('/equipments');
    return _extractList(response.data);
  }

  // PACKAGES
  Future<List> getPackages() async {
    final response = await _dio.get('/packages');
    return _extractList(response.data);
  }

  // STORIES
  Future<List> getStories() async {
    final response = await _dio.get('/stories');
    return _extractList(response.data);
  }

  //LOGIN
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await _dio.post(
      '/login',
      data: {"email": email, "password": password},
    );
  }

  //LOGOUT
  Future<Response> logout(String token) async {
    return await _dio.post(
      '/logout',
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  // REGISTER
  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await _dio.post(
      '/register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
  }

  // COMMON RESPONSE HANDLER
  List _extractList(dynamic data) {
    if (data is Map && data.containsKey('data')) {
      return data['data'] as List;
    }
    return data as List;
  }
}
