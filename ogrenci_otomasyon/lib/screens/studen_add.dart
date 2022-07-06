import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/student.dart';
import 'package:ogrenci_otomasyon/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students = [];
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students = [];
  var student = Student.withOutInfo();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(50.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  buildSubmitButton()
                ],
              )),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Örenci Adı", hintText: "örn:Mahmut"),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Örenci SoyAdı", hintText: "örn:Cemşir"),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "örn:40"),
      validator: validateGrade,
      onSaved: (String? value) {
        student.grade = value?.length.toInt();
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
