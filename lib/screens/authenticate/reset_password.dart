import 'package:fb_project/screens/authenticate/reset_password_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController email = TextEditingController();
  final AuthService _auth = AuthService();
  String email1 = '';
  final _formKey = GlobalKey<FormState>();
  bool buttonVal = true;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          title: const Text(
            'Сброс пароля',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: BackButton(
            style: const ButtonStyle(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color(0xFF9744D8),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                ], focal: Alignment.topLeft, radius: 1.4),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  const Color(0xFF006767),
                  const Color(0xFF000000).withOpacity(0),
                  const Color(0xFF000000).withOpacity(0),
                ], focal: Alignment.centerRight, radius: 1.4),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Введите Email',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    child: const Text(
                      'Введите Email, который вы указывали при регистрации. Мы отправим инструкцию по восстановлению учетной записи ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC3C3C3),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child: const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFC3C3C3),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 48,
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              expands: false,
                              validator: (value) =>
                                  value!.isEmpty ? 'Email is required' : null,
                              controller: email,
                              decoration: InputDecoration(
                                fillColor: Color(0xFF000000),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    child: SvgPicture.asset(
                                      'lib/imagess/Vector (2).svg',
                                      height: 5,
                                      width: 5,
                                    ),
                                  ),
                                ),
                                iconColor: Color(0xFF000000),
                                hintText: 'Введите Email',
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
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              await _auth.resetPassword(email).then((value) =>
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ResetPassword2(
                                      email: email.text,
                                    );
                                  })));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.only(left: 25, right: 25),
                              height: 48,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF8942BC),
                                      Color(0xFF5831F7),
                                      Color(0xFF5731F8),
                                      Color(0xFF00C2C2),
                                    ],
                                  )),
                              child: const Center(
                                child: Text(
                                  'Продолжить',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.only(left: 25, right: 25),
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFF714BD8).withOpacity(0.25),
                              ),
                              child: const Center(
                                child: Text(
                                  'Вернуться',
                                  style: TextStyle(
                                      color: Color(0xFF714BD8),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
