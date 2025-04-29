// import 'package:flutter/material.dart';
// import 'package:shop_app/services/auth_service.dart';
// import '/components/custom_surfix_icon.dart';
// import '/components/form_error.dart';
// import '/constants.dart';
// import '/helper/keyboard.dart';
// import '/screens/forgot_password/forgot_password_screen.dart';
// import '/screens/login_success/login_success_screen.dart';
//
// class SignForm extends StatefulWidget {
//   final AuthService authService;
//
//   const SignForm({Key? key, required this.authService}) : super(key: key);
//
//   @override
//   _SignFormState createState() => _SignFormState();
// }
//
// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;
//   bool? remember = false;
//   final List<String?> errors = [];
//
//   void addError({String? error}) {
//     if (!errors.contains(error)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }
//
//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error);
//       });
//     }
//   }
//
//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       try {
//         await widget.authService.login(email!, password!);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginSuccessScreen()),
//         );
//       } catch (e) {
//         addError(error: e.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeError(error: kEmailNullError);
//               } else if (emailValidatorRegExp.hasMatch(value)) {
//                 removeError(error: kInvalidEmailError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addError(error: kEmailNullError);
//                 return "";
//               } else if (!emailValidatorRegExp.hasMatch(value)) {
//                 addError(error: kInvalidEmailError);
//                 return "";
//               }
//               return null;
//             },
//             decoration: const InputDecoration(
//               labelText: "Email",
//               hintText: "Enter your email",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             obscureText: true,
//             onSaved: (newValue) => password = newValue,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeError(error: kPassNullError);
//               } else if (value.length >= 8) {
//                 removeError(error: kShortPassError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addError(error: kPassNullError);
//                 return "";
//               } else if (value.length < 8) {
//                 addError(error: kShortPassError);
//                 return "";
//               }
//               return null;
//             },
//             decoration: const InputDecoration(
//               labelText: "Password",
//               hintText: "Enter your password",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Checkbox(
//                 value: remember,
//                 activeColor: kPrimaryColor,
//                 onChanged: (value) {
//                   setState(() {
//                     remember = value;
//                   });
//                 },
//               ),
//               const Text("Remember me"),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(
//                     context, ForgotPasswordScreen.routeName),
//                 child: const Text(
//                   "Forgot Password",
//                   style: TextStyle(decoration: TextDecoration.underline),
//                 ),
//               )
//             ],
//           ),
//           FormError(errors: errors),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: _login,
//             child: const Text("Continue"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import '/components/custom_surfix_icon.dart';
import '/components/form_error.dart';
import '/constants.dart';
import '/helper/keyboard.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/login_success/login_success_screen.dart';
import '/services/auth_service.dart';

class SignForm extends StatefulWidget {
  final AuthService authService;

  const SignForm({Key? key, required this.authService}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  AuthService get _authService => widget.authService;

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
              return;
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
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then attempt to log in
                KeyboardUtil.hideKeyboard(context);

                // Call AuthService to attempt login
                try {
                  await widget.authService.login(email!, password!);
                  // If login successful, navigate to success screen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                } catch (e) {
                  // If login fails, show error message
                  print('Failed to login: $e');
                  // You can also display an error message to the user here
                }
              }
            },
            child: const Text("Continue"),
          ),

        ],
      ),
    );
  }
}

