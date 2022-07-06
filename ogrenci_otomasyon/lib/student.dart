class Student {
  int? id;
  String? firstName;
  String? lastName;
  int? grade;
  String? _status;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student.withOutInfo() {}

  String get getFirstName {
    return firstName!;
  }

  set setFirstName(String value) {
    firstName = value;
  }

  get getStatus {
    String message = "";
    if (this.grade! >= 50) {
      message = "Geçtiniz";
    } else {
      message = "Kaldınız";
    }
    return message;
  }
}
