import 'package:flutter/material.dart';
import 'package:signin_page/app/widget/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _reEnterPasswordController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  String? validateEmail(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ||
            !value.contains("@gmail.com")
        ? 'Enter a valid email address'
        : null;
  }
  
  String? passwordValidator(String? value) {
    final validCharacters =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]+$');
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (value.length < 8) {
      return 'Minimum Password length is 8';
    } else if (!validCharacters.hasMatch(value)) {
      print(value);
      return 'Atleast one alphabet, number and special characters are needed.';
    }
    return null;
  }

   String? confirmPasswordValidator(String? values) {
    setState(() {});
    final validCharacter =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[a-zA-Z\d@$!%*?&]+$');

    if (values == null || values.isEmpty) {
      return 'Field cannot be empty';
    } else if (_passwordController.text != values) {
      print(values);
      return "password not matching $values";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 35, 65),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 14, 35, 65),
          title: const Text(
            "Back",
            style: TextStyle(color: Color.fromARGB(255, 204, 161, 97)),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                    child: Text(
                  'Email',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
                reusableTextField(
                    myController: _emailController,
                    text: 'example@mail.com',
                    isPassword: false,
                    validator:  (value) => validateEmail(value),
                    ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'New Password',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                reusableTextField(
                    myController: _passwordController,
                    text: 'Choose a secure password',
                    isPassword: true,
                    validator: (value) => passwordValidator(value),
                    ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Re-enter New Password',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                reusableTextField(
                    myController: _reEnterPasswordController,
                    text: 'Choose a secure password',
                    isPassword: true,
                    validator: (value) => confirmPasswordValidator(value),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                      validateAndSave();
                    }, 
                    style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 204, 161, 97), // Background color
  ),
                    child: Text('Create Account')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
