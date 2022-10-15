import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();

  
  sign(email, password) async {
    return await dio.post('https://saman9.herokuapp.com/authenticate',
        data: {"email": email, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  
  login(email, password) async {
    return await dio.post('https://saman9.herokuapp.com/authenticate',
        data: {"email": email, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
