import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final localhost = "https://localhost:7199/";

  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$localhost$endPoint');
    return response.data;
  }
}
