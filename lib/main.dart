import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.transparent,
        ),
    child: bmi_calculator(),
        ),
    );
  }
}

// ignore: camel_case_types
class bmi_calculator extends StatefulWidget {

  @override
  _bmi_calculatorState createState() => _bmi_calculatorState();
}
// ignore: camel_case_types
class _bmi_calculatorState extends State<bmi_calculator> {

  String result = "";
  double height;
  double weight;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text("BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 18, 32, 47),
            fontWeight: FontWeight.bold,
          )),
        ),
        body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("Your Height in feet:",
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: heightController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your Height in feet",
                    filled: true,
                    fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                  ),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("Your Weight in kilogram:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: weightController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Your Weight in kilogram",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });
                      calculateBmi(height, weight);
                    },
                    child: Text("CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Stack(
                  children: [
                      Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('images/bmi_reading.png'),
                        ),
                      ),
                Container(
                  alignment: Alignment.center,
                 margin: new EdgeInsets.symmetric(vertical: 120.0),
                  child: Text("$result",
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
          ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight){
    double finalresult = weight / ((height / 3.2808) * (height / 3.2808));
    String bmi = finalresult.toStringAsFixed(1);
    setState(() {
      result = bmi;
    });
  }

}

