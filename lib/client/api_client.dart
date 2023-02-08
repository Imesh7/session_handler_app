import 'package:dio/dio.dart';
import 'package:session_handling_flutter/client/refresh_token_handler.dart';



class ApiClient {
  Dio dio = Dio();
  Dio refreshToken = Dio();

  setBaseOptons() {
    dio.options.baseUrl = "http://HOSTNAME/api";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    dio.options.sendTimeout = 2000;

   refreshToken.options.baseUrl = "http://MOCKOONHOSTNAME";
    refreshToken.options.connectTimeout = 5000;
    refreshToken.options.receiveTimeout = 5000;
    refreshToken.options.sendTimeout = 2000; 

    dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) async {
      //RefreshTokenHandler().handleToken(e, handler, refreshToken, dio);
    }));

    refreshToken.interceptors.add(InterceptorsWrapper(onError: (e, handler) async {
      RefreshTokenHandler().handleToken(e, handler, refreshToken , dio);
    }));
  }

  ApiClient() {
    setBaseOptons();
  }

  /* final interceptorWrapper = InterceptorsWrapper(onError: (e, handler) async {
    RefreshTokenHandler().handleToken(e, handler);
  }); */
}
