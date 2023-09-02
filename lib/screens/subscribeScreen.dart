import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/screens/HomeScreen.dart';
import 'package:movieapp/screens/ThirdPaymentScreen.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class subscibeScreen extends StatefulWidget {
  const subscibeScreen({Key? key}) : super(key: key);

  @override
  State<subscibeScreen> createState() => _subscibeScreenState();
}

class _subscibeScreenState extends State<subscibeScreen> {
  var email = "";
  var password = "";
  void verifyUser(email, password) async {
    try {
      CollectionReference doc_ref =
          FirebaseFirestore.instance.collection('students');
      QuerySnapshot querySnapshot = await doc_ref.get();
      final List storedocs = [];
      querySnapshot.docs.map((DocumentSnapshot document) {
        Map a = document.data() as Map<String, dynamic>;
        storedocs.add(a);
        a['id'] = document.id;
      }).toList();
      int x = 0;
      for (int i = 0; i < storedocs.length; i++) {
        if (password == storedocs[i]['password'] &&
            email == storedocs[i]['email']) {
          x = 1;
          Get.to(HomeScreen(x: "you have complete access ♛"));
          break;
        } else {
          continue;
        }
      }
      if (x == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid User".toUpperCase()),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid User".toUpperCase()),
      ));
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Subscibe Screen",
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
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white30,
                    ),
                    hintText: "Email",
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
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.white30,
                    ),
                    hintText: "Password",
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
                      setState(() {
                        email = emailController.text.trim();
                        password = passwordController.text.trim();

                        // clear
                      });
                      print(email);
                      print(password);
                      verifyUser(email, password);
                      // Get.to(HomeScreen(x: "you have complete access ♛"));
                    },
                    height: 50,
                    width: 110,
                    text: 'Login',
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
              Text(
                "New User?? To Subscribe",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  Get.to(ThirdPaymentScreen());
                },
                child: Text(
                  "Click Here".toUpperCase(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
