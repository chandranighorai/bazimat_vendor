import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key key}) : super(key: key);

  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  TextEditingController _oldPassword, _newPassword, _confirmPassword;
  var dio = Dio();
  @override
  void initState() {
    super.initState();
    _oldPassword = new TextEditingController();
    _newPassword = new TextEditingController();
    _confirmPassword = new TextEditingController();
  }

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
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Change Password",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  buildText("Old Password"),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  buildText("New Password"),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  buildText("Confirm Password"),
                ],
              ),
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.05,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.buttonColor)),
                  onPressed: () => _changePassword(),
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  buildText(String hintText) {
    print("HintText..." + hintText.toString());
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.02))),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: TextFormField(
        controller: hintText == "Old Password"
            ? _oldPassword
            : hintText == "New Password"
                ? _newPassword
                : _confirmPassword,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }

  _changePassword() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var email = pref.getString("email");
      print("Email..." + email.toString());
      var token = pref.getString("token");
      print("Email..." + token.toString());
      var params = "?email=" +
          email.toString() +
          "&old_password=" +
          _oldPassword.text.toString() +
          "&new_password=" +
          _newPassword.text.toString() +
          "&confirm_password=" +
          _confirmPassword.text.toString();
      var url = Const.changePassword + params;
      print("Url in change Password..." + url.toString());
      var response = await dio.put(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print("Response data in password..." + response.data.toString());
      if (response.data['state'] == 1) {
        showCustomToast(response.data['errors'][0]["message"]);
      } else {
        showCustomToast(response.data["message"]);
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
