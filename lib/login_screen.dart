import 'package:fb_project/formatfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static initializeApp() {}
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                CostomTextt1(mycontroller: email, hintText: 'Enter Your email'),
                const Text('Password'),
                CostomTextt1(
                    mycontroller: password, hintText: 'Enter Your password'),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  alignment: Alignment.topRight,
                  child: const Text('Forgot Password?'),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
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
