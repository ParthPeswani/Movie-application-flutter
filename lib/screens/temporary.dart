import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Temporary extends StatelessWidget {
  const Temporary({Key? key, required this.movieName, required this.movielink})
      : super(key: key);
  final String movieName, movielink;

  // Temporary({required this.movieName, required this.movielink});
  // String movieName, movielink;

  // String movieName, movielink;

  @override
  Widget build(BuildContext context) {
    final Uri toLaunchMovie = Uri.parse(movielink);
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "🎥 TEMPORARY",
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Get Your Movie Link",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.orange,
                  ),
                ),
              ),
              Text(
                movieName.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchInBrowser(toLaunchMovie);
                        },
                        child: Text(
                          movielink,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                                ClipboardData(text: movielink));
                            // print("success");
                          },
                          icon: Icon(
                            Icons.copy,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Text(
                  "Copy the link provided and use it in any browser to access movie."
                      .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "WARNING 💀",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: Colors.red,
                  ),
                ),
              ),
              Text(
                "If you leave this page without copying the link you may have to pay again to reach to this link."
                    .toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Colors.white70,
                ),
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
