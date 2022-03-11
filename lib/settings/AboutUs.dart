import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var dio = Dio();
  bool _aboutUs;
  var aboutData;
  @override
  void initState() {
    super.initState();
    _aboutUs = false;
    _getAboutUs();
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
          "About Us",
          style: TextStyle(color: AppColors.buttonColor),
        ),
      ),
      body: _aboutUs == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: ListView(
                  children: [Html(data: aboutData)],
                ),
              ),
            ),
    );
  }

  _getAboutUs() async {
    try {
      var response = await dio.get(Const.configResturent);
      print("privacy..." + response.data.toString());
      if (response.data["state"] == 0) {
        setState(() {
          aboutData = response.data["about_us"];
          _aboutUs = true;
        });
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
