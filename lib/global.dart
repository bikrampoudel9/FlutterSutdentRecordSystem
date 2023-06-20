import 'package:studentrecordsystem/student.dart';

class Global {
  static List<Student> studentList = [];
  static void addStudent(Student student) {
    studentList.add(student);
    print("Added");
  }
}
