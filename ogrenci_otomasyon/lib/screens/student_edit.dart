import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/student.dart';
import 'package:ogrenci_otomasyon/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student? selectedStudent;
  StudentEdit(Student? selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student? selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student? selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent!.firstName,
      decoration:
          InputDecoration(labelText: "Örenci Adı", hintText: "örn:Mahmut"),
      validator: validateFirstName,
      onSaved: (String? value) {
        selectedStudent?.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent!.lastName,

      decoration:
          InputDecoration(labelText: "Örenci SoyAdı", hintText: "örn:Cemşir"),
      validator: validateLastName,
      onSaved: (String? value) {
        selectedStudent?.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
      initialValue: selectedStudent!.grade;

    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "örn:40"),
      validator: validateGrade,
      onSaved: (String? value) {
        selectedStudent?.grade = value?.;
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent?.firstName);
    print(selectedStudent?.lastName);
    print(selectedStudent?.grade);
  }
}
