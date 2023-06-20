import 'package:flutter/material.dart';
import 'package:studentrecordsystem/global.dart';
import 'package:studentrecordsystem/student.dart';

class ViewStudent extends StatefulWidget {
  const ViewStudent({Key? key}) : super(key: key);

  @override
  State<ViewStudent> createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  List<Student> studentList = Global.studentList;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: "cursive",
      fontSize: 15,
    );
    return Scaffold(
      body: studentList.isEmpty
          ? emptyMessage()
          : ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                Student student = studentList[index];
                return Dismissible(
                  key: Key('$index'),
                  onDismissed: (direction) {
                    setState(() {
                      studentList.removeAt(index);
                    });
                  },
                  background: Container(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(1, 1))
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 222, 222)
                                  .withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID: ${student.id}",
                            style: textStyle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Name: ${student.name}",
                            style: textStyle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Address: ${student.address}",
                            style: textStyle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Contact: ${student.contact}",
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget emptyMessage() {
    return const Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.hourglass_empty_outlined, size: 30),
        SizedBox(
          height: 10,
        ),
        Text("Nothing to show!"),
      ]),
    );
  }
}
