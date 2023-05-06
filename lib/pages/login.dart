import '../main.dart';
import '../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/services/store.dart';
import 'package:omnishare_mobile/services/api.dart';
import 'package:form_field_validator/form_field_validator.dart';
import './home.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final api = API();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode
              .onUserInteraction, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Text("Omnishare"),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    controller: emailFieldController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText:
                            'Enter valid email id as example@example.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email"),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                    controller: passwordFieldController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText:
                              "Password should be at least 6 characters long"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be longer than 15 characters")
                    ])),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      api.setLoginDetails(emailFieldController.text,
                          passwordFieldController.text);
                      final dynamic result = await api.dioLogin();
                      if (result == true) {
                        
                        navigationKey.currentState?.setPage(0);
                        
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.mainSuccess,
                            content: const Text('Login successful')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.mainError,
                            content: const Text('Invalid credentials')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: AppColors.mainError,
                          content: const Text('Invalid credentials')));
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text('New User? Create Account'),
            ],
          ),
        ),
      ),
    );
  }
}
