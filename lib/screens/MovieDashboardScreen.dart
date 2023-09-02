import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:movieapp/screens/PaymentScreen.dart';
import 'package:movieapp/screens/temporary.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDashboardScreen extends StatelessWidget {
  const MovieDashboardScreen(
      {Key? key,
      required this.movieName,
      required this.x,
      required this.cast,
      required this.imgurl,
      required this.description,
      required this.trailerLink,
      required this.movielink})
      : super(key: key);

  final String movieName, x, cast, imgurl, description, trailerLink, movielink;

  @override
  Widget build(BuildContext context) {
    final Uri toLaunchTrailer = Uri.parse(trailerLink);
    return Scaffold(
      backgroundColor: Colors.white10,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Shimmer(
                duration: Duration(seconds: 3), //Default value
                interval:
                    Duration(seconds: 3), //Default value: Duration(seconds: 0)
                color: Colors.white, //Default value
                colorOpacity: 0.2, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLeftToRight(), //Default Value
                child: Image.network(imgurl),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName.toUpperCase(),
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w900,
                          fontSize: 35),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "STAR CAST ( " + cast + " )",
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Text("DESCRIPTION :\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
              ),
              Text(description,
                  style: TextStyle(
                      color: Colors.yellowAccent, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer(
                    duration: Duration(seconds: 3), //Default value
                    interval: Duration(
                        seconds: 3), //Default value: Duration(seconds: 0)
                    color: Colors.white, //Default value
                    colorOpacity: 0.2, //Default value
                    enabled: true, //Default value
                    direction:
                        ShimmerDirection.fromLeftToRight(), //Default Value
                    child: AnimatedButton(
                      onPress: () {
                        if (x == "subscribe to have complete access ♛") {
                          Get.to(PaymentScreen(
                              movieName: movieName, movielink: movielink));
                        } else {
                          Get.to(Temporary(
                            movieName: movieName,
                            movielink: movielink,
                          ));
                        }
                        ;
                      },
                      height: 50,
                      width: 110,
                      text: '💰WATCH NOW',
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
                  Shimmer(
                    duration: Duration(seconds: 3), //Default value
                    interval: Duration(
                        seconds: 3), //Default value: Duration(seconds: 0)
                    color: Colors.white, //Default value
                    colorOpacity: 0.2, //Default value
                    enabled: true, //Default value
                    direction:
                        ShimmerDirection.fromLeftToRight(), //Default Value
                    child: AnimatedButton(
                      onPress: () {
                        _launchInBrowser(toLaunchTrailer);
                      },
                      height: 50,
                      width: 110,
                      text: '🎥TRAILER',
                      isReverse: true,
                      selectedTextColor: Colors.redAccent,
                      transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.white),
                      backgroundColor: Colors.red,
                      borderColor: Colors.redAccent,
                      borderWidth: 2,
                      borderRadius: 15,
                    ),
                  ),
                ],
              ),
            ],
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
