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
                  hintText: 'Email',
                  isObsecre: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: 'Password',
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
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffe83434),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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