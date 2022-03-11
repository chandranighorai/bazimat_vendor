import 'package:bazimat_vendor_app/login/LogIn.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  var email, otpToken;
  ResetPassword({this.email, this.otpToken, Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _newPassText, _confirmPassText;
  var dio = Dio();
  bool _resetEnable;
  @override
  void initState() {
    super.initState();
    _resetEnable = true;
    _newPassText = new TextEditingController();
    _confirmPassText = new TextEditingController();
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
          "reset Password",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
        child: Column(
          children: [
            TextFormField(
              controller: _newPassText,
              decoration: InputDecoration(hintText: 'New Password'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            TextFormField(
              controller: _confirmPassText,
              decoration: InputDecoration(hintText: 'Confirm Password'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: _resetEnable == false
                        ? MaterialStateProperty.all(
                            AppColors.buttonColor.withOpacity(0.2))
                        : MaterialStateProperty.all(AppColors.buttonColor)),
                onPressed: () {
                  _resetEnable == false ? null : _resetPassword();
                },
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  _resetPassword() async {
    try {
      print("newPass..." + _newPassText.text.toString());
      print("newPass..." + _confirmPassText.text.toString());
      if (_newPassText.text.isEmpty || _confirmPassText.text.isEmpty) {
        showCustomToast("Field should not empty");
      } else if (_newPassText.text != _confirmPassText.text) {
        showCustomToast("Confirm password has not matched");
      } else if (_newPassText.text.length < 6 ||
          _confirmPassText.text.length < 6) {
        showCustomToast("password must be minimum 6 character");
      } else {
        setState(() {
          _resetEnable = false;
        });
        var params = "?email=" +
            widget.email.toString() +
            "&reset_token=" +
            widget.otpToken.toString() +
            "&password=" +
            _newPassText.text.toString() +
            "&confirm_password=" +
            _confirmPassText.text.toString();
        var url = Const.resetPassword + params;
        var response = await dio.put(url);
        print("response body..." + response.data.toString());
        if (response.data["state"] == 1) {
          showCustomToast(response.data["errors"][0]["message"]);
          setState(() {
            _resetEnable = true;
          });
        } else {
          showCustomToast(response.data["message"]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn()));
        }
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
