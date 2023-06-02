import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:siakad_akademik_polsub/app/data/login_provider.dart';
import 'package:siakad_akademik_polsub/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void authLogin() {
    String email = txtEmail.text;
    String password = txtPassword.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email atau Password tidak boleh kosong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      EasyLoading.show();
      var data = {
        "email": email,
        "password": password,
      };
      LoginProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          var responseBody = value.body;
          var data = responseBody['data'];
          print(data);
          SpUtil.putString('name', data['name']);
          SpUtil.putString('token', data['token']);
          SpUtil.putString('email', data['email']);
          SpUtil.putString('id', data['id'].toString());
          Get.offAllNamed(Routes.BERANDA);
          Get.snackbar(
            "Success",
            "Login Berhasil",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Login Gagal",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        EasyLoading.dismiss();
      });
    }
  }
}
