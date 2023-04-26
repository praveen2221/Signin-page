import 'package:flutter/material.dart';

class reusableTextField extends StatefulWidget {
  final TextEditingController myController;
  final String text;
  final bool isPassword;
  final String? Function(String?)? validator;
  const reusableTextField(
      {Key? key,
      required this.myController,
      required this.text,
      required this.isPassword, 
      required this.validator
      })
      : super(key: key);

  @override
  State<reusableTextField> createState() => _reusableTextFieldState();
}

class _reusableTextFieldState extends State<reusableTextField> {
  bool _passwordVisibles = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        enableSuggestions: widget.isPassword,
        autocorrect: widget.isPassword,
        obscureText:widget.isPassword ? _passwordVisibles : widget.isPassword,
        controller: widget.myController,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white.withOpacity(0.9)),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisibles
                        ? Icons.visibility_sharp
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisibles = !_passwordVisibles;
                    });
                  },
                )
              : null,
          fillColor: Colors.white.withOpacity(0.3),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }
}