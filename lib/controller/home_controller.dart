import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:session_handling_flutter/client/api_client.dart';
import 'package:session_handling_flutter/core/services/shared_pref.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;

  getHomeData() async {
    isLoading = true;
    try {
      String? accesToken = await SharedPref.getAccessToken();
      Response response = await ApiClient().refreshToken.post("/dashboard",
          options: Options(headers: {"Authorization": accesToken}));

      if (response.statusCode == 200) {
        
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
