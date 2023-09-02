import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:movieapp/screens/MovieDashboardScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class NetflixScreen extends StatelessWidget {
  const NetflixScreen({Key? key, required this.x}) : super(key: key);
  final String x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "OTT 🎬🎥",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Netflix").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text(
                  "something went wrong",
                  style: TextStyle(color: Colors.white),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              if (snapshot != null && snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String movieName = snapshot.data!.docs[index]['name'];
                    String cast = snapshot.data!.docs[index]['cast'];
                    String imgurl = snapshot.data!.docs[index]['ImageLink'];
                    String description =
                        snapshot.data!.docs[index]['description'];
                    String trailerLink =
                        snapshot.data!.docs[index]['trailerLink'];
                    final Uri toLaunchTrailer = Uri.parse(trailerLink);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AnimatedCard(
                        direction: AnimatedCardDirection
                            .top, //Initial animation direction
                        initDelay: Duration(
                            milliseconds: 0), //Delay to initial animation
                        duration: Duration(
                            milliseconds: 550), //Initial animation duratio
                        curve: Curves.bounceIn, //Animation curve
                        child: Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: Colors.white30,
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(MovieDashboardScreen(
                                  movieName: movieName,
                                  x: x,
                                  cast: cast,
                                  imgurl: imgurl,
                                  description: description,
                                  trailerLink: trailerLink,
                                  movielink: trailerLink,
                                ));
                              },
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35))),
                                tileColor: Colors.black26,
                                leading: Container(
                                  child: Image.network(imgurl),
                                  width: 80,
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "STAR CAST ( " + cast + " )",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white70),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              children: [
                                                AnimatedButton(
                                                  onPress: () {
                                                    Get.to(() =>
                                                        MovieDashboardScreen(
                                                          movieName: movieName,
                                                          x: x,
                                                          cast: cast,
                                                          imgurl: imgurl,
                                                          description:
                                                              description,
                                                          trailerLink:
                                                              trailerLink,
                                                          movielink:
                                                              trailerLink,
                                                        ));
                                                  },
                                                  height: 50,
                                                  width: 120,
                                                  text: "💰WATCH NOW",
                                                  isReverse: true,
                                                  selectedTextColor:
                                                      Colors.lightGreen,
                                                  transitionType: TransitionType
                                                      .LEFT_BOTTOM_ROUNDER,
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                  backgroundColor: Colors.green,
                                                  borderColor:
                                                      Colors.greenAccent,
                                                  borderWidth: 2,
                                                  borderRadius: 15,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                AnimatedButton(
                                                  onPress: () {
                                                    _launchInBrowser(
                                                        toLaunchTrailer);
                                                  },
                                                  height: 50,
                                                  width: 90,
                                                  text: '🎥TRAILER',
                                                  isReverse: true,
                                                  selectedTextColor:
                                                      Colors.redAccent,
                                                  transitionType: TransitionType
                                                      .LEFT_BOTTOM_ROUNDER,
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                                  backgroundColor: Colors.red,
                                                  borderColor: Colors.redAccent,
                                                  borderWidth: 2,
                                                  borderRadius: 15,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                title: Text(
                                  movieName.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                // subtitle: Text(description),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
