import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'เกี่ยวกับแอปพลิเคชัน',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/about.png',
                width: 130,
                height: 130,
              ),
              const SizedBox(height: 30),
              Text(
                'แอปพลิเคชันนี้ถูกพัฒนาเพื่อช่วยในการคำนวณค่าดัชนีมวลกาย (BMI) และให้ข้อมูลที่เป็นประโยชน์เกี่ยวกับสุขภาพ',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                'Body Mass Index Calculator',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/bmi_image.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 16),
              Text('vvvvvvv'),
              const SizedBox(height: 8),
              Text('dddddddddd'),
              const SizedBox(height: 30),
              Image.network(
                'https://example.com/developer_image.png',
                width: 100,
              ),
              const SizedBox(height: 10),
              Text(
                'Developed by Your Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
