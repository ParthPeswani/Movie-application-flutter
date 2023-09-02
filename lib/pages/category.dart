import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/movieAdd.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 150,
                child: ElevatedButton(
                  onPressed: () =>
                      {Get.to(AddMoviePage(collection: "Bollywood"))},
                  child: Text(
                    'Bollywood',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: ElevatedButton(
                  onPressed: () =>
                      {Get.to(AddMoviePage(collection: "Hollywood"))},
                  child: Text(
                    'Hollywood',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: ElevatedButton(
                  onPressed: () => {Get.to(AddMoviePage(collection: "South"))},
                  child: Text(
                    'South',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: ElevatedButton(
                  onPressed: () =>
                      {Get.to(AddMoviePage(collection: "Netflix"))},
                  child: Text(
                    'Netflix',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
