import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "HELP DESK",
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
                height: 300,
                child: Lottie.asset("assets/animation1.json"),
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
                    onPress: () {
                      send();
                    },
                    height: 50,
                    width: 110,
                    text: 'EMAIL',
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Email your query between 10am to 8pm",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "we will try our level best to get back to you as soon as possible.",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> send() async {
    final Email email = Email(
      body: "Write your query here and mail us.",
      subject: "Customer query".toUpperCase(),
      recipients: ["p.peswani8283@gmail.com"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    // if (!mounted) return;
    //
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(platformResponse),
    //   ),
    // );
  }
}
