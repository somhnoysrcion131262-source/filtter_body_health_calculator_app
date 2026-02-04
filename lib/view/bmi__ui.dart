// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //ตัวควบคุม TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  double bmiValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                _buildTextField('น้ำหนัก (kg.)', 'กรอกน้ำหนักของคุณ', wCtrl),
                SizedBox(height: 20),
                _buildTextField('ส่วนสูง (cm.)', 'กรอกส่วนสูงของคุณ', hCtrl),
                SizedBox(height: 30),
                _buildCalculateButton(),
                SizedBox(height: 15),
                _buildResetButton(),
                SizedBox(height: 30),
                _buildBmiResultContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton(
      onPressed: () {
        //คำนวณ BMI
        //Validate input
        if (wCtrl.text.isEmpty || hCtrl.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        //คำนวณ และแสดงผล
        double w = double.parse(wCtrl.text);
        double h = double.parse(hCtrl.text) / 100; //แปลง cm เป็น m
        //****************/
        setState(() {
          bmiValue = w / (h * h);
        });
        //****************/
      },
      child: Text(
        'คำนวณ BMI',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        textStyle: TextStyle(fontSize: 18),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          55.0,
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          wCtrl.clear();
          hCtrl.clear();
          bmiValue = 0;
        });
      },
      child: Text(
        'ล้างข้อมูล',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[400],
        textStyle: TextStyle(fontSize: 18),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          55.0,
        ),
      ),
    );
  }

  Widget _buildBmiResultContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'BMI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              bmiValue.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

