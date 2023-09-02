import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/pages/category.dart';
import 'package:movieapp/pages/list_student_page.dart';

import 'add_student_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icon(Icons.add),
              Text("User"),
            ],
          ),
          onPressed: () {
            Get.to(AddStudentPage());
          }),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Admin'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Category(),
                  ),
                )
              },
              child: Text('Add Movie', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
