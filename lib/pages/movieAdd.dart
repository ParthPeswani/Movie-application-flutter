// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMoviePage extends StatefulWidget {
  String collection;
  // AddStudentPage({Key? key}) : super(key: key);
  AddMoviePage({
    required this.collection,
  });
  @override
  _AddMoviePageState createState() => _AddMoviePageState(collection);
}

class _AddMoviePageState extends State<AddMoviePage> {
  String collection;
  _AddMoviePageState(this.collection);

  final _formKey = GlobalKey<FormState>();

  var ImageLink = "";
  var cast = "";
  var description = "";
  var movielink = "";
  var name = "";
  var trailerLink = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final ImageLinkController = TextEditingController();
  final castController = TextEditingController();
  final descriptionController = TextEditingController();
  final movielinkController = TextEditingController();
  final trailerLinkController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    ImageLinkController.dispose();
    movielinkController.dispose();
    trailerLinkController.dispose();
    castController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    ImageLinkController.clear();
    movielinkController.clear();
    trailerLinkController.clear();
    castController.clear();
    descriptionController.clear();
  }
  // String col = "students";
  // Adding Student

  Future<void> addUser(collection) {
    CollectionReference movie =
        FirebaseFirestore.instance.collection(collection);
    return movie
        .add({
          'name': name,
          'ImageLink': ImageLink,
          'trailerLink': trailerLink,
          'movielink': movielink,
          'cast': cast,
          'description': description,
        })
        .then((value) => print('Movie Added'))
        .catchError((error) => print('Failed to Add Movie: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Movie to " + collection),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Image Link: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: ImageLinkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Image Link';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'MovieLink: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: movielinkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter movielink';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Trailer Link: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: trailerLinkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Trailer Link';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Cast: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: castController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter cast';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Description: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text;
                            ImageLink = ImageLinkController.text;
                            trailerLink = trailerLinkController.text;
                            movielink = movielinkController.text;
                            cast = castController.text;
                            description = descriptionController.text;
                            addUser(collection);
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
