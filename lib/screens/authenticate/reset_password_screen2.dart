// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPassword2 extends StatefulWidget {
  String email;
  ResetPassword2({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ResetPassword2> createState() => _ResetPassword2State();
}

class _ResetPassword2State extends State<ResetPassword2> {
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
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 5),
                Center(
                  child: Container(
                    child: SvgPicture.asset('lib/imagess/icons (6).svg'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Text(
                  'Проверьте почту!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Мы отправили временный пароль на Email ${widget.email} Если сообщение не пришло — проверьте папку «Спам». ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFC3C3C3),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 25, right: 25),
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
            )
          ],
        ),
      ),
    );
  }
}
