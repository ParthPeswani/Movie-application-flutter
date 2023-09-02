import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:movieapp/screens/EmailScreen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SecondPaymentScreen extends StatelessWidget {
  const SecondPaymentScreen(
      {Key? key, required this.movieName, required this.movielink})
      : super(key: key);
  final String movieName, movielink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "PAYMENT",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/Screenshot_20230317_145345.jpg"),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "UPI ID - 7976736211502@paytm",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Pay 10rs. using this QR Code or UPI ID after successful payment click on Proceed Now Button",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
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
                      Get.to(EmailScreen(
                        movieName: movieName,
                        temp: 'movie link',
                      ));
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
            ],
          ),
        ),
      ),
    );
  }
}
