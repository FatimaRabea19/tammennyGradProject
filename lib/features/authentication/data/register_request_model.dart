class RegisterRequestModel {
  final String fullname;
  final String email;
  final String password;
  final int age;
  final String? parentEmail;

  RegisterRequestModel({
    required this.fullname,
    required this.email,
    required this.password,
    required this.age,
    this.parentEmail,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "password": password,
      "age": age,
      if (parentEmail != null) "parentEmail": parentEmail,
    };
  }
}
