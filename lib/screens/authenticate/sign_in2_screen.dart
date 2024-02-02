import 'package:fb_project/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn2 extends StatefulWidget {
  const SignIn2({super.key});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  String usernamee = '';
  String emaill = '';
  String passwordd = '';

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  /*Future addUserDetails(String userName, String email) async {
    // CollectionReference<Map<String, dynamic>> add = _inst.collection('users');
    await FirebaseFirestore.instance.collection('users').doc().set({
      'name': userName,
      'email': email,
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: const Color(0xFF696868),
      ),
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                /*const Text('User Name'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: userName,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
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
                      usernamee = value;
                    });
                  },
                ),*/
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text('User Name'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: userName,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Name',
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
                            usernamee = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Email'),
                      const SizedBox(
                        height: 10,
                      ),
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
                      ),
                      const SizedBox(
                        height: 10,
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          dynamic result =
                              _auth.signUpwithEmail(email.text, password.text);
                        }
                        AuthService().addUserDetails(
                            userName.text.toString(), email.text.toString());
                      });
                    },
                    color: const Color.fromARGB(255, 211, 196, 181),
                    child: const Text('Create Account'),
                  ),
                ),
              ],
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
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
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
