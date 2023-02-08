import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:session_handling_flutter/core/services/shared_pref.dart';

class RefreshTokenHandler {
  handleToken(
      DioError error, ErrorInterceptorHandler handler, Dio refresh, Dio dio) {
    switch (error.response!.statusCode) {
      case 401:
        callRefreshtoken(error, handler, refresh, dio);
        break;
      default:
    }
  }

  void callRefreshtoken(DioError error, ErrorInterceptorHandler handler,
      Dio refresh, Dio dio) async {
    String? refreshToken = await SharedPref.getRefreshToken();
    Response response = await refresh.post("/refresh_token",
        options: Options(headers: {"Authorization": refreshToken}));
    debugPrint("${response.data} & ${error.requestOptions.method}");

    if (response.statusCode == 200) {
      SharedPref.setAccessToken(response.data["access_token"]);
      SharedPref.setRefreshToken(response.data["refresh_token"]);
      try {
        Response reqResponse = await refresh.request(error.requestOptions.path,
            options: Options(
                method: error.requestOptions.method,
                headers: {"Authorization": response.data["access_token"]}));
        handler.resolve(reqResponse);
      } catch (e) {
        handler.reject(error);

        debugPrint(e.toString());
      }
    } else {
      debugPrint("Token Expired");
    }
  }
}
