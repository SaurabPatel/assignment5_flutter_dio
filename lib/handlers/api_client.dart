import 'package:assignment4_dio/models/login_request.dart';
import 'package:assignment4_dio/models/login_resp.dart';
import 'package:dio/dio.dart';


class ApiClient {

  final _dio = Dio();

  Future<LoginResponse?> login(LoginRequest loginReqest) async {
    try {
      Response loginResp = await _dio.post("https://reqres.in/api/login", data: loginReqest.toJson());
      return LoginResponse.fromJson(loginResp.data);
    }on DioError catch (e) {
      print(e);
    }
  }

}