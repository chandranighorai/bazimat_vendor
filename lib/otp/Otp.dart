import 'package:bazimat_vendor_app/otp/ResetPassword.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  var email;
  Otp({this.email, Key key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var dio = Dio();
  String otpText;
  bool _verifyEnable;
  @override
  void initState() {
    super.initState();
    _verifyEnable = true;
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
          "OTP",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Plaese give 4 digit OTP"),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.buttonColor,
              focusedBorderColor: AppColors.buttonColor,
              cursorColor: AppColors.buttonColor,
              showFieldAsBox: true,
              autoFocus: true,
              enabledBorderColor: AppColors.buttonColor,
              onSubmit: (value) {
                print("Val in otpField..." + value.toString());
                otpText = value;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: _verifyEnable == false
                          ? MaterialStateProperty.all(
                              AppColors.buttonColor.withOpacity(0.2))
                          : MaterialStateProperty.all(AppColors.buttonColor)),
                  onPressed: () {
                    _verifyEnable == false ? null : _verify();
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  _verify() async {
    try {
      if (otpText == null) {
        print("otpText..." + otpText.toString());
        showCustomToast("Give OTP properly");
      } else {
        print("otpText..." + otpText.toString());
        setState(() {
          _verifyEnable = false;
        });
        var params = "?email=" +
            widget.email.toString() +
            "&reset_token=" +
            otpText.toString();
        var url = Const.otpVerification + params;
        print("response body..." + url.toString());
        var response = await dio.post(url);
        print("response body..." + response.data.toString());
        if (response.data['state'] == 1) {
          showCustomToast(response.data["errors"][0]['message']);
          setState(() {
            _verifyEnable = true;
          });
        } else {
          showCustomToast(response.data['message']);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResetPassword(
                      email: widget.email.toString(),
                      otpToken: otpText.toString())));
        }
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
