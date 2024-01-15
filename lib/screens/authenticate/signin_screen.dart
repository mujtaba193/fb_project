import 'package:fb_project/formatfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SinIn'),
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
                  'Sign In',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('User Name'),
                const SizedBox(
                  height: 10,
                ),
                CostomTextt1(
                    mycontroller: userName, hintText: 'Enter Your Name'),
                const SizedBox(
                  height: 10,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 10,
                ),
                CostomTextt1(mycontroller: email, hintText: 'Enter Your email'),
                const SizedBox(
                  height: 10,
                ),
                const Text('Password'),
                CostomTextt1(
                    mycontroller: password, hintText: 'Enter Your password'),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () async {},
              color: const Color.fromARGB(255, 211, 196, 181),
              child: const Text('Sign in'),
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
