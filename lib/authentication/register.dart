import 'package:flutter/material.dart';
import 'package:foodpand_sellers_app/widget/custom_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController locationController = TextEditingController();

  // 現在地取得のための変数
  Position? position;
  List<Placemark>? placeMarks;

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
        const SizedBox(height: 50),
        Form(
            key: _formKey,
            child: Column(
              children: [
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
                        style: TextStyle(color: Color(0xffe83434)),
                      ),
                      icon: const Icon(
                        Icons.location_on,
                        color: Color(0xffe83434),
                      ),
                      onPressed: () {
                        getCurrentLocation();
                        print('clicked');
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xffe83434),
                          ),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    )),
                const SizedBox(
                  height: 30,
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
