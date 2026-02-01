import 'package:filtter_body_health_calculator_app/view/about_ui.dart';
import 'package:filtter_body_health_calculator_app/view/bmi__ui.dart';
import 'package:filtter_body_health_calculator_app/view/bmr_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้างตัวเเปรควบคุม currentlndex ของ BarItem
  int currentIndexStatus = 1;

  //สร้างตัวเเปลเก็บ widget หน้าจอที่จะมาเเสดงที่ body ของ Scaffold
  List<Widget> screens = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 114, 86),
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndexStatus = value;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 123, 236, 9),
        currentIndex: currentIndexStatus,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.personBooth,
              ),
              label: 'BMR'),
        ],
      ),
      body: screens[currentIndexStatus],
    );
  }
}
