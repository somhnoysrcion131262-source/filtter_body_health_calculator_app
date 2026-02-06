import 'home_ui.dart';
import 'package:flutter/material.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // ให้หน่วงเวลา 3 วินาทีแล้วเปิดไปหน้า HOMEUi แบบย้อนกลับไม่ได้
    Future.delayed(
      //เวลาที่หน่วง
      Duration(seconds: 3),
      //เมื่อครบเวลาเเล้วจะให้ทำอะไร???? ณ ที่นี้จะเปิดหน้า  HomeUi แบบย้อนกลับไม่ได้
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(111, 136, 111, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/calculater.png',
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'boby Health Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
