// @dart=2.9
class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 3) {
      return "Öğrenci isminin uzunluğu 3 harften kısa olamaz ";
    }
  }

  String validateLastName(String value) {
    if (value.length < 3) {
      return "Öğrenci isminin uzunluğu 3 harften kısa olamaz ";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır.";
    }
  }
}
