import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/widget/custom_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // ImagePickerから取り出すファイルが
  // XFile形式だからここでXFile形式にしておく。
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  // 現在地取得のための変数
  Position? position;
  List<Placemark>? placeMarks;

  // voidとは
  // => returnがない事は決まってるから、わかりやすく印を付けとく
  // つまり何も返ってこない
  // Future<戻り値>を指定している
  Future<void> _getImage() async {
    // 「_」はプライベート変数を表す
    // プライベート変数にすることで、
    // 外部からのアクセスを出来する
    // プライベート変数はこのように
    // 関数(function)を使って値を変更する。
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  // 現在地取得のための関数
  getCurrentLocation() async {
    // この1行がないとIOSだと機能しない
    await Geolocator.requestPermission();

    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    placeMarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    print('プレースマークス');
    print(placeMarks);

    Placemark pMark = placeMarks![0];

    print('pマーク');
    print(placeMarks);

    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    print('住所？');
    print(completeAddress);

    locationController.text = completeAddress;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            child: Column(
      // maxはspace-betweenに近い
      // minはデフォルト上（もしくは下）詰め
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 30),
        InkWell(
            onTap: () {
              _getImage();
            },
            // CircleAvatarはbackgroundImage
            // に指定したのを、丸くしてくれるやつ？
            child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundImage: imageXFile == null
                    ? null
                    : FileImage(File(imageXFile!.path)),
                child: imageXFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        size: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.white,
                      )
                    : null)),
        const SizedBox(height: 10),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  data: Icons.person,
                  controller: nameController,
                  hintText: '名前',
                  isObsecre: false,
                ),
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
                CustomTextField(
                  data: Icons.lock,
                  controller: confirmPasswordController,
                  hintText: 'パスワード(確認用)',
                  isObsecre: true,
                ),
                CustomTextField(
                  data: Icons.phone,
                  controller: phoneController,
                  hintText: '電話番号',
                  isObsecre: false,
                ),
                CustomTextField(
                  data: Icons.my_location,
                  controller: locationController,
                  hintText: 'お店の住所',
                  isObsecre: false,
                ),
                Container(
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: const Text(
                        '現在地を取得する',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        getCurrentLocation();
                        print('clicked');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('新規登録',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffe83434),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 15
                      ),
                  ),
                  onPressed: () {
                    print('clicked!');
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ],
    )));
  }
}
