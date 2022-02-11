import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/widget/progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      key: key,
      radius: 30,
      color: Colors.white,
    );
  }
}
