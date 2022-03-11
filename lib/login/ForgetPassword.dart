import 'package:bazimat_vendor_app/login/LogIn.dart';
import 'package:bazimat_vendor_app/otp/Otp.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailText;
  var dio = Dio();
  bool _submitEnable;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _submitEnable = true;
    _emailText = new TextEditingController();
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
          "Forget Password",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.width * 0.02)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 5.0)
                    ]),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06),
                child: TextFormField(
                  controller: _emailText,
                  decoration: InputDecoration(
                      hintText: "Enter email", border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: _submitEnable == false
                        ? MaterialStateProperty.all(
                            AppColors.buttonColor.withOpacity(0.2))
                        : MaterialStateProperty.all(AppColors.buttonColor)),
                onPressed: () {
                  _submitEnable == false ? null : _submit();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  _submit() async {
    if (_emailText.text.length == 0) {
      showCustomToast("Field should not empty");
    } else {
      setState(() {
        _submitEnable = false;
      });
      var params = "?email=" + _emailText.text;
      var url = Const.forgetPassword + params;
      var response = await dio.post(url);
      print("forget..." + response.data.toString());
      if (response.data["state"] == 0) {
        showCustomToast(response.data["message"]);
        setState(() {
          _submitEnable = true;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Otp(email: _emailText.text)));
      } else {
        showCustomToast(response.data["errors"][0]["message"]);
        setState(() {
          _submitEnable = true;
        });
      }
    }
  }
}
