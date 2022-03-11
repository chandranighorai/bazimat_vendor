import 'package:bazimat_vendor_app/settings/AboutUs.dart';
import 'package:bazimat_vendor_app/settings/PasswordChange.dart';
import 'package:bazimat_vendor_app/settings/PrivacyPolicy.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
        child: Column(
          children: [
            buildText("Change Password"),
            buildText("Privacy Policy"),
            buildText("About Us"),
          ],
        ),
      ),
    );
  }

  buildText(String text) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () => _pageMove(text),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.05,
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage(text == "Change Password"
                          ? "images/padlock.png"
                          : text == "Privacy Policy"
                              ? "images/insurance.png"
                              : "images/info.png"))),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ));
  }

  _pageMove(String text) {
    if (text == "Change Password") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PasswordChange()));
    } else if (text == "Privacy Policy") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutUs()));
    }
  }
}
