import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pedomatic_app/model/equipments_model.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api',
        connectTimeout: const Duration(seconds: 10),
        headers: {"Accept": "application/json"},
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final box = Hive.box('userInformations');
        final token = box.get('token');
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));
  }

  // EQUIPMENTS
  Future<List> getEquipments() async {
    final response = await _dio.get('/equipments');
    return _extractList(response.data);
  }

  Future<Map<String, dynamic>> getEquipmentDetails(String equipmentId) async {
    final response = await _dio.get('/equipment-details/$equipmentId');
    return response.data;
  }

  // ORDERS
  Future<Response> placeOrder({
    required String deviceId,
    required List<Map<String, dynamic>> orderItems,
    required String paymentMethod,
    required double totalAmount,
  }) async {
    return await _dio.post(
      '/orders',
      data: {
        "device": deviceId,
        "orderItems": orderItems,
        "paymentMethod": paymentMethod,
        "totalAmount": totalAmount,
      },
    );
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

  // FORUMS
  Future<List> getForums() async {
    final response = await _dio.get('/forum');
    return _extractList(response.data);
  }

  Future<Response> createForum(String subject, String content) async {
    return await _dio.post('/forum', data: {
      'forum_subject': subject,
      'forum_content': content,
    });
  }

  // PROFILE
  Future<Response> updateProfile(String name, String email, String phone) async {
    return await _dio.post('/update-profile', data: {
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  Future<Map<String, dynamic>> getMe() async {
    final response = await _dio.get('/me');
    return response.data;
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
