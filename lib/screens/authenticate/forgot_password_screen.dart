import 'package:fb_project/screens/services/auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  final AuthService _auth = AuthService();
  String email1 = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      child: const Text('Submit'),
                      color: const Color.fromARGB(255, 131, 105, 136),
                      onPressed: () async {
                        await _auth
                            .resetPassword(email.text)
                            .then((value) => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'We sent you link to reset password check your email'),
                                  );
                                }));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
