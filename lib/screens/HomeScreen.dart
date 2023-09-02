import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/verification.dart';
import 'package:movieapp/screens/BollywoodScreen.dart';
import 'package:movieapp/screens/HelpScreen.dart';
import 'package:movieapp/screens/HollywoodScreen.dart';
import 'package:movieapp/screens/Netflix.dart';
import 'package:movieapp/screens/SouthScreen.dart';
import 'package:movieapp/screens/subscribeScreen.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.x}) : super(key: key);
  final String x;
  // HomeScreen({required this.x});

  // String x;

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          splashColor: Colors.white54,
          hoverColor: Colors.white70,
          hoverElevation: 50,
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Icon(Icons.live_help),
              Text("Help"),
            ],
          ),
          onPressed: () {
            Get.to(HelpScreen());
          }),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "🎥 MOVIE AT TEN",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScrollLoopAutoScroll(
              scrollDirection: Axis.horizontal,
              delay: Duration(seconds: 1),
              // enableScrollInput: true,
              duration: Duration(seconds: 400),
              // delayAfterScrollInput: Duration(seconds: 50),
              // gap: 50,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    height: 250,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.red,
                      // margin: EdgeInsets.only(bottom: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(BollywoodScreen(x: x));
                        },
                        child: Image.asset("assets/Screenshot (92).png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    height: 250,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.yellow,
                      // margin: EdgeInsets.only(bottom: 2.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(HollywoodScreen(x: x));
                          },
                          child: Image.asset("assets/Screenshot (93).png")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    height: 250,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.black45,
                      // margin: EdgeInsets.only(bottom: 2.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(NetflixScreen(x: x));
                          },
                          child: Image.asset("assets/Screenshot (94).png")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    height: 250,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.orange,
                      // margin: EdgeInsets.only(bottom: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(SouthScreen(x: x));
                        },
                        child: Image.asset("assets/Screenshot (95).png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              onPressed: () {
                if (x == "subscribe to have complete access ♛") {
                  Get.to(subscibeScreen());
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    x.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(BollywoodScreen(x: x));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/bollywood.png"),
                              Expanded(
                                child: Text(
                                  "BOLLYWOOD 🎥",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(HollywoodScreen(x: x));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/hollywood.png"),
                              Expanded(
                                child: Text(
                                  "HOLLYWOOD 🎥",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 3),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(SouthScreen(x: x));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/south.png"),
                              Expanded(
                                child: Text(
                                  "SOUTH DUB 🎥",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(NetflixScreen(x: x));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/netflix.jpg"),
                              Expanded(
                                child: Text(
                                  "OTT PLATFORMS🎥",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                if (x == "subscribe to have complete access ♛") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 1,
                      content: Text("Unauthorized Request".toUpperCase()),
                    ),
                  );
                } else {
                  Get.to(verification());
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "ADMIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
