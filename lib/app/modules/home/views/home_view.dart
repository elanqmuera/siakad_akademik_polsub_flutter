import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siakad_akademik_polsub/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(4),
            child: Image.asset(
              'images/gambar/LogoPolsub.png',
            ),
          ),
          title: const Text(
            'Siakad Polsub',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    child: Image.asset(
                      'images/gambar/polsub.png',
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Siakad Polsub',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  "Lakukan Monitoring Presensi dan Nilai \n Mahasiswa Politeknik Negeri Subang",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => controller.onTapLogin(),
                  child: Text(
                    "L O G I N",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 14, 142),
                      fixedSize: Size(Get.width - 70, 40)),
                ),
              ],
            ),
          ),
        ));
  }
}
