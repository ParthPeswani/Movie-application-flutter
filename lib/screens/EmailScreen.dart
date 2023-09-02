import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:movieapp/screens/InformationScreen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({Key? key, required this.movieName, required this.temp})
      : super(key: key);
  final String movieName, temp;
  // EmailScreen({required this.movieName, required this.temp});
  // String movieName, temp;
  //
  // String movieName, temp;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController utrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Verification Form",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Lottie.asset("assets/99951-verification.json"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white30,
                    ),
                    hintText: "Sender Name",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(width: 3, color: Colors.redAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white30,
                    ),
                    hintText: "Email ID",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(width: 3, color: Colors.redAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: utrController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.white30,
                    ),
                    hintText: "UTR No. of Payment",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(width: 3, color: Colors.redAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: "Movie Name - " + movieName,
                  readOnly: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.movie,
                      color: Colors.white30,
                    ),
                    hintText: "Movie Name",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer(
                  duration: Duration(seconds: 3), //Default value
                  interval: Duration(
                      seconds: 3), //Default value: Duration(seconds: 0)
                  color: Colors.white, //Default value
                  colorOpacity: 0.2, //Default value
                  enabled: true, //Default value
                  direction: ShimmerDirection.fromLeftToRight(), //Default Value
                  child: AnimatedButton(
                    onPress: () async {
                      await sendEmail(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          subject: "Payment Verification",
                          message: "Sender Name - " +
                              nameController.text.trim() +
                              " Email - " +
                              emailController.text.trim() +
                              " UTR NO. - " +
                              utrController.text.trim() +
                              " Movie Name - " +
                              movieName);
                      Get.to(InformationScreen(temp: temp));
                    },
                    height: 50,
                    width: 110,
                    text: 'PROCEED',
                    isReverse: true,
                    selectedTextColor: Colors.redAccent,
                    transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.white),
                    backgroundColor: Colors.green,
                    borderColor: Colors.greenAccent,
                    borderWidth: 2,
                    borderRadius: 15,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Where to find UTR No. ??",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceId = 'service_xsnu4pw';
    final templateId = 'template_ziv8iri';
    final user_Id = 'gzZfcIAoIL44bZJwR';
    final privateKey = 'sTqG9LRfLptq34eOuURK7';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // 'origin': 'http://localhost'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': user_Id,
        'accessToken': privateKey,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
    print(response.body);
  }
}
