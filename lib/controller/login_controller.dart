import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:session_handling_flutter/client/api_client.dart';
import 'package:session_handling_flutter/core/services/shared_pref.dart';
import 'package:session_handling_flutter/view/home.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  login(BuildContext context) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        isLoading = true;
        notifyListeners();

        Response response =
            await ApiClient().dio.post("/customer-login", data: {
          "customer_email": emailController.text,
          "customer_password": passwordController.text
        });

        if (response.data['status'] == "Success") {
         await SharedPref.setAccessToken(response.data['token']);
        await  SharedPref.setAccessToken(response.data['refreshToken']);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
