import 'package:flutter/material.dart';
import 'package:week3_complete_project/splash_page.dart';
import 'const.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weekly DSC",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kPrimaryColor,
      ),
      home: SplashPage(),
    );
  }
  //TODO1: Tambahkan aplikasi ke firebase
  //TODO2: Tambahkan library firebase
  //TODO3: Tambahkan data ke firebase
  //TODO4: Ubah HomePage agar dapat menarik data dari firebase
  //TODO5: Tambahkan page baru bernama add_page.dart
  //TODO6: Desain Page tersebut untuk pertemuan berikutnya
}
