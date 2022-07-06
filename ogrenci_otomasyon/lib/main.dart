import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/screens/studen_add.dart';
import 'package:ogrenci_otomasyon/screens/student_edit.dart';

import 'student.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.withId(0, "", "", 0);
  List<Student> students = [
    Student.withId(1, "Can", "bayazıt", 100),
    Student.withId(2, "Kaan", "sefiroğ", 80),
    Student.withId(3, "Kerem", "kemt", 10)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ÖĞRENCİ TAKİP SİSTEMİ'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black12,
                      backgroundImage: NetworkImage(
                          "https://www.medikarhastanesi.com/wp-content/uploads/2018/03/person-man.png"),
                    ),
                    title: Text(students[index].firstName.toString() +
                        " " +
                        students[index].lastName.toString()),
                    subtitle: Text("Sınavdan Aldığı sonuç: " +
                        " " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus.toString() +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(students[index].firstName.toString() +
                          " " +
                          students[index].lastName.toString());
                    },
                  );
                }),
          ),
          Text(
              "Seçilen öğrenci : ${selectedStudent.firstName} ${selectedStudent.lastName}"),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 15,
                        ),
                        Text("EKLE"),
                      ],
                    )),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StudentEdit(selectedStudent)));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 5,
                        ),
                        Text("GÜNCELLE"),
                      ],
                    )),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        students.remove(selectedStudent);
                      });
                      print(selectedStudent.firstName);

                      var mesaj = "";
                      mesajGoster(context, mesaj);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 15,
                        ),
                        Text("SİL"),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  String sinavHesapla() {
    String mesaj = "SEÇİLEN ÖĞRENCİ SİLİNDİ!";
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("DİKKAT"),
      content: Text(sinavHesapla() + selectedStudent.firstName.toString()),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildStatusIcon(int? grade) {
    if (grade! >= 50) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.clear);
    }
  }
}
