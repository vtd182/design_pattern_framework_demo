import 'package:d_validation/d_validation.dart';
import 'package:design_pattern_framework_demo/custom_rule.dart';

//
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
}

class UserValidation extends DValidator<UserModel> {
  UserValidation() {
    ruleFor((user) => user.email, key: 'email').notEmpty().validEmail();
    ruleFor((user) => user.age, key: 'age').min(18, message: 'Minimum age is 18 years');
    ruleFor((user) => user.phone, key: 'phone').mustHaveNumber().notEmpty();
    ruleFor((user) => user.password, key: 'password').customValidPassword();
  }
}
