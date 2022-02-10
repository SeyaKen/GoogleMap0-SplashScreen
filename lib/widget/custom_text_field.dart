import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.controller,
    this.data,
    this.hintText,
    this.isObsecre,
    this.enabled,
  }) : super(key: key);

  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  bool? isObsecre = true;
  bool? enabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObsecre!, // パスワードモード（文字を隠す）
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            // これをnoneにしないとfocusした時に
            // 下にborderができちゃう
            // やってみれば分かる
            border: InputBorder.none,
            prefixIcon: Icon(
              data,
              color: Colors.cyan,
            ),
            focusColor: Theme.of(context).primaryColor,
            hintText: hintText,
          )
        )
    );
  }
}
