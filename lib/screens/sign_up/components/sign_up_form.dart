import 'package:flutter/material.dart';
import 'package:shop_app/services/auth_service.dart';
import '../../../models/User.dart';
import '/components/custom_surfix_icon.dart';
import '/components/form_error.dart';
import '/constants.dart';
import 'package:shop_app/models/user.dart' as UserModel; // Added prefix "UserModel"
import '../../complete_profile/complete_profile_screen.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required AuthService authService}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  String? location;
  String? confirmPassword;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kEmailNullError);
            } else if (emailValidatorRegExp.hasMatch(value)) {
              removeError(error: kInvalidEmailError);
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kEmailNullError);
              return "";
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              addError(error: kInvalidEmailError);
              return "";
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            password = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (value.length < 8) {
              addError(error: kShortPassError);
              return "";
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          onSaved: (newValue) => name = newValue,
          decoration: const InputDecoration(
            labelText: "Name",
            hintText: "Enter your name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          onSaved: (newValue) => location = newValue,
          decoration: const InputDecoration(
            labelText: "Location",
            hintText: "Enter your location",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          obscureText: true,
          onSaved: (newValue) => confirmPassword = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.isNotEmpty && password == confirmPassword) {
              removeError(error: kMatchPassError);
            }
            confirmPassword = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (password != value) {
              addError(error: kMatchPassError);
              return "";
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "Confirm Password",
            hintText: "Re-enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
        ),
        FormError(errors: errors),
        const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Create a new User instance
                  User newUser = User(
                    email: email!,
                    password: password!,
                    name: name!,
                    location: location!,
                    image: null, // Set image to null initially
                    id: null, // Set id to null
                  );

                  // If all fields are valid, navigate to the next screen
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName, arguments: newUser);
                }
              },
              child: const Text("Continue"),
            ),
          ],
        ),
    );
  }
}
