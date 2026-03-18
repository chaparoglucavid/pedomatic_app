import 'package:dio/dio.dart';

Future<int?> registerUser(
  String name,
  String email,
  String password,
) async {
  final dio = Dio();

  String url = 'http://10.0.2.2:8000/api/register';

  final response = await dio.post(
    url,
    data: {
      'email': email,
      'password': password,
      'password_confirmation': password,
    },
    options: Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  return response.statusCode;
}
