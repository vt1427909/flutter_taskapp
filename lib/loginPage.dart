// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _obscureText = true;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   String? _validateEmail(String? value) {
//     if (value!.isEmpty) {
//       return 'Email is required';
//     }
//     // Add more email validation logic as needed
//     return null;
//   }
//
//   String? _validatePassword(String? value) {
//     if (value!.isEmpty) {
//       return 'Password is required';
//     }
//     // Add more password validation logic as needed
//     return null;
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Perform login logic here
//       // For now, just print the email and password
//       print('Email: ${_emailController.text}');
//       print('Password: ${_passwordController.text}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                   height: 400,
//                   width: 400,
//                   child: Image.asset("assets/images/splash_1.png")),
//               SizedBox(
//                 height: 25,
//               ),
//               Center(
//                   child: Container(
//                       child: Text(
//                 'Login Page',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.italic),
//               ))),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50)),
//                     prefixIcon: Icon(Icons.email),
//                     labelText: 'Email'),
//                 validator: _validateEmail,
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50)),
//                     prefixIcon: Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: _toggle,
//                     ),
//                     labelText: 'Password'),
//                 obscureText: true,
//                 validator: _validatePassword,
//               ),
//               SizedBox(height: 24.0),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: Colors.blue),
//                 onPressed: _submitForm,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_aap/signup.dart';

import 'dashboard/homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _emailID,
      _password = "",
      _email = "abc@gmail.com",
      _pass = "Try.t.r.y@1";
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  // get EmailValidator => "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      // if (_emailID == _email && _password == _pass) {
      //
      // }
    }
  }

  Widget emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Username",
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (email) => _emailID = email!,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: "Pin",
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggle,
        ),
      ),
      validator: (password) {
        String pattern = r'[0-9]';
        RegExp regex = RegExp(pattern);
        if (password!.isEmpty) {
          return 'Please Enter Password';
        } else if (!regex.hasMatch(password))
          // ignore: curly_braces_in_flow_control_structures
          return 'Enter valid password';
        else
          // ignore: curly_braces_in_flow_control_structures
          return null;
      },
      onSaved: (password) => _password = password!,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome,",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Sign in to continue!",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                const SizedBox(
                  height: 50,
                ),
                emailInput(),
                const SizedBox(
                  height: 20,
                ),
                passInput(),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: validateLogin,
                    // padding: const EdgeInsets.all(0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffff5f6d),
                            Color(0xffff5f6d),
                            Color(0xffffc371),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                            maxWidth: double.infinity, minHeight: 50),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   child: FlatButton(
                //     onPressed: () {},
                //     color: Colors.indigo.shade50,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Image.asset(
                //           "assets/images/facebook.png",
                //           height: 18,
                //           width: 18,
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         const Text(
                //           "Connect with Facebook",
                //           style: TextStyle(
                //               color: Colors.indigo,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   child: FlatButton(
                //     onPressed: () {},
                //     color: Colors.indigo.shade50,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Image.asset(
                //           "assets/images/facebook.png",
                //           height: 18,
                //           width: 18,
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         const Text(
                //           "Connect with Facebook",
                //           style: TextStyle(
                //               color: Colors.indigo,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
