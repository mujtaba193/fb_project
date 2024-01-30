import 'package:fb_project/screens/authenticate/reset_password.dart';
import 'package:fb_project/screens/authenticate/sign_in2_screen.dart';
import 'package:fb_project/screens/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();

  static initializeApp() {}
}

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String email1 = '';
  String password1 = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: const Color(0xFF696868),
      ),
      drawer: const Drawer(),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      'lib/imagess/download.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email1 = value;
                          });
                        },
                      ),
                      const Text('Password'),
                      TextFormField(
                        validator: (value) => value!.length < 8
                            ? 'password must be mor than 8 chars'
                            : null,
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password1 = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ResetPasswordScreen();
                              }));
                            },
                            child: const Text('Forgot Password?')),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result =
                                await _auth.loginwithEmail(email1, password1);
                          }
                        },
                        color: const Color.fromARGB(255, 211, 196, 181),
                        child: const Text('Login'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 105, 105, 105),
                        child: const Text('Login with Google'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignIn2();
                }));
              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Don't have account?"),
                  TextSpan(
                    text: "Register",
                    style: TextStyle(color: Colors.blue),
                  )
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
