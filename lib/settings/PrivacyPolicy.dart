import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  var dio = Dio();
  bool _privacyLoad;
  var privacyData;
  @override
  void initState() {
    super.initState();
    _privacyLoad = false;
    _getPrivacyPolicy();
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
          "Privacy Policy",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: _privacyLoad == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    children: [
                      Html(
                        data: privacyData,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _getPrivacyPolicy() async {
    try {
      var response = await dio.get(Const.configResturent);
      print("privacy..." + response.data.toString());
      if (response.data["state"] == 0) {
        setState(() {
          privacyData = response.data["privacy_policy"];
          _privacyLoad = true;
        });
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
