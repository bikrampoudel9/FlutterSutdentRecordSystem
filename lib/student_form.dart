import 'package:flutter/material.dart';
import 'package:studentrecordsystem/global.dart';
import 'package:studentrecordsystem/student.dart';
import 'package:studentrecordsystem/view_student.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  String? idError;
  String? nameError;
  String? addressError;
  String? contactError;

  int totalStudents = Global.studentList.length;

  @override
  Widget build(BuildContext context) {
    const TextStyle label = TextStyle(
      fontFamily: "Georgia",
      fontSize: 12,
    );
    double textFieldHeight = 50;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Record System"),
        ),

        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                "Student Record System",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              Text("Total Students $totalStudents"),
              SizedBox(
                width: 200,
                height: textFieldHeight,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                      errorText: idError,
                      errorStyle: const TextStyle(fontSize: 9),
                      contentPadding: const EdgeInsets.all(10),
                      border: const OutlineInputBorder(),
                      label: const Text(
                        "ID",
                      )),
                ),
              ),
              SizedBox(
                width: 200,
                height: textFieldHeight,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    errorText: nameError,
                    contentPadding: const EdgeInsets.all(7),
                    border: const OutlineInputBorder(),
                    label: const Text("Name"),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: textFieldHeight,
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(),
                    label: Text("Address"),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: textFieldHeight,
                child: TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(),
                    label: Text("Contact"),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    if (addStudent()) {
                      setState(() {
                        totalStudents = Global.studentList.length;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully Added"),
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Not Added"),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    print(Global.studentList.length);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ViewStudent();
                    })).then((value) {
                      setState(() {
                        totalStudents = Global.studentList.length;
                      });
                    });
                  },
                  child: const Text("View"),
                ),
              ),
            ],
          ),
        ));
  }

  bool addStudent() {
    String id = idController.text;
    String name = nameController.text;
    String address = addressController.text;
    String contact = contactController.text;
    bool isValid = validation(id, name, address, contact);
    if (isValid) {
      Global.addStudent(Student(id, name, address, contact));
      return true;
    } else {
      print("not valid");
      return false;
    }
  }

  bool validation(String id, String name, String address, String contact) {
    bool isValid = true;
    if (id.isEmpty) {
      setState(() {
        idError = "Empty Id";
      });
      isValid = false;
    }
    if (name.isEmpty) {
      setState(() {
        nameError = "Empty Name";
      });
      isValid = false;
    }
    if (address.isEmpty) {
      setState(() {
        addressError = "Empty Address";
      });
      isValid = false;
    }
    if (contact.isEmpty) {
      setState(() {
        contactError = "Empty Contact";
      });
      isValid = false;
    }
    return isValid;
  }
}
