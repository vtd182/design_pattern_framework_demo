import 'package:d_validation/d_validation.dart';

class UserModel {
  String email;
  String password;
  int age;
  String phone;

  UserModel({
    required this.email,
    required this.password,
    required this.age,
    required this.phone,
  });

  factory UserModel.empty() => UserModel(email: '', password: '', age: 18, phone: '');
}

class UserValidation extends DValidator<UserModel> {
  UserValidation() {
    ruleFor((user) => user.email, key: 'email').notEmpty().validEmail();

    ruleFor((user) => user.age, key: 'age').min(18, message: 'Minimum age is 18 years');
  }

  void validateUser(UserModel user) {
    final result = validate(user);
    if (result.isValid) {
      print('User is valid');
    } else {
      print('User is invalid');
    }
  }
}
