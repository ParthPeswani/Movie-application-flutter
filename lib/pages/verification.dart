import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class verification extends StatelessWidget {
  verification({Key? key}) : super(key: key);

  TextEditingController admin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Admin".toUpperCase(),
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: admin,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Admin Key",
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 3, color: Colors.redAccent)),
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
              interval:
                  Duration(seconds: 3), //Default value: Duration(seconds: 0)
              color: Colors.white, //Default value
              colorOpacity: 0.2, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLeftToRight(), //Default Value
              child: AnimatedButton(
                onPress: () {
                  if (admin.text.trim() == "parth") {
                    Get.to(HomePage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Unauthorised request".toUpperCase()),
                    ));
                  }
                },
                height: 50,
                width: 110,
                text: 'VERIFY',
                isReverse: true,
                selectedTextColor: Colors.redAccent,
                transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                textStyle:
                    TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
                backgroundColor: Colors.green,
                borderColor: Colors.greenAccent,
                borderWidth: 2,
                borderRadius: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
