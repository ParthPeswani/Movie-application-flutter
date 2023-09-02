import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key, required this.temp}) : super(key: key);
  final String temp;
  // InformationScreen({required this.temp});
  // String temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "INFORMATION",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              "Your Payment Verification Form is under process, It may take upto 10HRS for payment verification. Sorry For Inconviences caused, we would Email you the " +
                  temp +
                  " you Paid For after payment verification is completed",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              "If your Query is not solved you can contact us from help button on main screen",
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
