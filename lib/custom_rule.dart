import 'package:d_validation/d_validation.dart';

extension CustomValidPasswordValidator on SimpleValidationBuilder<String> {
  SimpleValidationBuilder<String> customValidPassword() {
    return notEmpty().minLength(8).mustHaveLowercase().mustHaveUppercase().mustHaveSpecialCharacter().mustHaveNumber();
  }
}
