import 'package:flutter/material.dart';
import 'package:loginstatefullfl/src/mixins/validation_mixin.dart';

class LoginScreen extends StatelessWidget with ValidationMixin {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  String? email = '';
  String? password = '';
  String? errorText;
  String EmptyError = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            PasswordField(),
            Container(margin: EdgeInsets.only(bottom: 25.0)),
            SubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'You@example.com',
        //    errorText: errorText
      ),
      //errorText != null ? Text('$errorText') : Text('$EmptyError')),
      validator: validatePassword,
      onSaved: (String? value) {
        email = value;
      },
    );
  }

  Widget PasswordField() {
    // return Container(
    //   margin: EdgeInsets.only(bottom: 25.0),
    //   child:
    // );

    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Email password',
        hintText: 'Password',
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        password = value;
      },
    );
  }

  Widget SubmitButton() {
    return TextButton(
      onPressed: () {
        print(formKey.currentState!.validate());
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print('object email $email $password password');
        }
        //formKey.currentState!.reset();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return green, otherwise blue
          if (states.contains(MaterialState.pressed)) {
            return Colors.red;
          }
          return Colors.yellow;
        }),
      ),
      child: Text('Submit'),
    );
  }
}
