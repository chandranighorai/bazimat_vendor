import 'package:bazimat_vendor_app/home/Home.dart';
import 'package:bazimat_vendor_app/login/ForgetPassword.dart';
import 'package:bazimat_vendor_app/login/userPreference.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _emailText, _passText;
  bool _isHidden;
  var dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailText = new TextEditingController();
    _passText = new TextEditingController();
    _isHidden = true;
  }

  void dispose() {
    super.dispose();
    _emailText.clear();
    _passText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("images/back.png"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.26,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(image: AssetImage("images/logo.png"))),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.00,
            // ),
            Text(
              "LOGIN".toUpperCase(),
              style: TextStyle(color: AppColors.buttonColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            buildText("username"),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            buildText("password"),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.03),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  //textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.buttonColor)),
                onPressed: _logIn,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  buildText(String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02)),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.0)]),
        padding: EdgeInsets.all(5),
        child: TextFormField(
          controller: hintText == "username" ? _emailText : _passText,
          obscureText: hintText == "password" ? _isHidden : false,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: hintText == "username"
                  ? SizedBox()
                  : IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )),
        ),
      ),
    );
  }

  _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  _logIn() async {
    print("emailText..." + _emailText.text.length.toString());
    print("passText..." + _passText.text.length.toString());
    if (_emailText.text.length == 0 || _passText.text.length == 0) {
      showCustomToast("Field should not blank");
    } else {
      var params = "?email=" + _emailText.text + "&password=" + _passText.text;
      var url = Const.loginUrl + params;
      print("Url..." + url.toString());
      var response = await dio.post(url);
      print("response in login..." + response.data.toString());
      if (response.data["state"] == 1) {
        showCustomToast(response.data["errors"][0]["message"]);
      } else {
        showCustomToast(response.data["message"]);
        saveUserPref(response.data['token'], response.data["zone_wise_topic"],
            _emailText.text,response.data["id"].toString());
        // _emailText.clear();
        // _passText.clear();
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }
    }
  }
}
