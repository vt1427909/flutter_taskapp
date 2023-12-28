import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_aap/loginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  List<User> registeredUsers = []; // Simple list to simulate a database

  bool isUsernameUnique(String username) {
    return !registeredUsers.any((user) => user.username == username);
  }

  void register() {
    String enteredUsername = _usernameController.text;

    // Check if the username is unique
    if (!isUsernameUnique(enteredUsername)) {
      // Show an error message for duplicate username
      showErrorMessage("Username '$enteredUsername' is already taken");
      return;
    }

    // Registration successful, add the user to the list (simulate database)
    // registeredUsers.add(User(enteredUsername));

    // Proceed with further actions, e.g., navigating to another page
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  bool _obscureText = true;

  String _password = "";

  // get EmailValidator => "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                  "Sign up to continue!",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    prefixIcon: const Icon(
                      Icons.format_color_text,
                      color: Colors.grey,
                    ),
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
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
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
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
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
                      return 'Please enter your mobile number';
                    } else if (value.length != 10) {
                      return 'Mobile Number must be of 10 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
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
                      return 'Please set a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
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
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
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
                      return 'Enter valid password';
                    else
                      return null;
                  },
                  onSaved: (password) => _password = password!,
                  textInputAction: TextInputAction.done,
                  obscureText: _obscureText,
                ),
                const SizedBox(height: 50),
                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       // All fields are valid, perform signup logic here
                //       // For now, just print the values
                //       print('Name: ${_nameController.text}');
                //       print('Email: ${_emailController.text}');
                //       print('Mobile Number: ${_mobileController.text}');
                //       print('Username: ${_usernameController.text}');
                //       print('PIN: ${_pinController.text}');
                //     }
                //   },
                //   child: Text('Sign Up'),
                // ),
                Container(
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
                          "Signup",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Mobile Number: ${_mobileController.text}');
      print('Username: ${_usernameController.text}');
      print('PIN: ${_pinController.text}');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}

class User {
  String username;
  String name;
  String mobile;
  String pin;
  String email;

  User(this.username, this.name, this.email, this.mobile, this.pin);
}
