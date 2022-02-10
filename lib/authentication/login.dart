import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'images/demaekan1.png',
                height: 150,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
               children: [
                CustomTextField(
                  data: Icons.email,
                  controller: emailController,
                  hintText: 'メールアドレス',
                  isObsecre: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: 'パスワード',
                  isObsecre: true,
                ),
               ],
            ),
          ),
          const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text(
                      'ログイン',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: const Color(0xffe83434),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 140,
                      vertical: 15
                    ),
                  ),
                  onPressed: () {
                    print('clicked!');
                  },
                ),
        ],
      )
    );
  }
}