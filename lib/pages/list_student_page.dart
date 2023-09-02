import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/update_student_page.dart';

class ListStudentPage extends StatefulWidget {
  ListStudentPage({Key? key}) : super(key: key);

  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  TextEditingController admin = TextEditingController();
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Subscribed Users".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  height: 400,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(50),
                            1: FixedColumnWidth(50),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Expiry',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.greenAccent,
                                    child: Center(
                                      child: Text(
                                        'Action',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < storedocs.length; i++) ...[
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['name'],
                                            style: TextStyle(fontSize: 12.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['email'],
                                            style: TextStyle(fontSize: 12.0))),
                                  ),
                                  TableCell(
                                    child: Center(
                                        child: Text(storedocs[i]['expiry'],
                                            style: TextStyle(fontSize: 12.0))),
                                  ),
                                  TableCell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateStudentPage(
                                                        id: storedocs[i]['id']),
                                              ),
                                            )
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              {deleteUser(storedocs[i]['id'])},
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: admin,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.black,
                        ),
                        hintText: "Expiry Date",
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(width: 3, color: Colors.redAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      for (var i = 0; i < storedocs.length; i++) {
                        if (storedocs[i]['expiry'] == admin.text.trim()) {
                          deleteUser(storedocs[i]['id']);
                        }
                      }
                    },
                    child: Text("check".toUpperCase()),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          );
        });
  }
}
