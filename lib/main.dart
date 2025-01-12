import 'package:d_validation/d_validation.dart';
import 'package:design_pattern_framework_demo/user.dart';
import 'package:flutter/material.dart';

void main() {
  DValidation.globalConfig.culture = Culture('vi');
  UserModel user = UserModel(
    email: "",
    password: "1231",
    age: 20,
    phone: "0362310231",
  );

  UserValidation userValidation = UserValidation();
  final res = userValidation.validate(user);
  if (res.isValid) {
    print('User is valid');
  } else {
    for (var element in res.exceptions) {
      print(element.message);
    }
  }

  //runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  String email = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DValidateEmailTextField(
              label: 'Email',
              keyField: 'email',
              controller: _emailController,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
