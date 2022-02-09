import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/widget/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController anyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          // maxはspace-betweenに近い
          // minはデフォルト上（もしくは下）詰め
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10),
            InkWell(
              // CircleAvatarはbackgroundImage
              // に指定したのを、丸くしてくれるやつ？
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundImage: imageXFile == null
                ? null
                : FileImage(File(imageXFile!.path)),
                child: imageXFile == null
                ? Icon(
                  Icons.add_photo_alternate,
                  size: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey,
                )
                : null
              )
            ),
            const SizedBox(height: 10),
            Form(
              
            )
          ],
        )
      )
    );
  }
}
