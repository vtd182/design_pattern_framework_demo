import 'package:d_validation/d_validation.dart';

class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});
}

class CountryValidation extends DValidator<Country> {
  CountryValidation() {
    ruleFor((country) => country.name, key: 'name').notEmpty().maxLength(50);
    ruleFor((country) => country.code, key: 'code').notEmpty().maxLength(2);
  }
}
