import 'dart:io';

import 'package:bazimat_vendor_app/drawer/Navigation.dart';
import 'package:bazimat_vendor_app/home/HomePageList.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dateFormatter;
  GlobalKey<ScaffoldState> ScaffFoldState = GlobalKey<ScaffoldState>();
  var dio = Dio();
  bool homeLoad = false;
  List dashBoardData;

  _onRefresh() {
    print("onRefresh called...");
    Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd('en_US');
    dateFormatter = formatter.format(now);
    fcmCheck();
    print(dateFormatter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffFoldState,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.buttonColor,
            ),
            onPressed: () => ScaffFoldState.currentState.openDrawer()),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Home",
              style: TextStyle(color: AppColors.buttonColor),
            ),
            Spacer(),
            IconButton(
                onPressed: () => _onRefresh(),
                icon: Icon(Icons.refresh, color: Colors.grey)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              dateFormatter.toString(),
              style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: MediaQuery.of(context).size.width * 0.04),
            )
          ],
        ),
      ),
      drawer: Navigation(),
      body: homeLoad == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _onRefresh(),
              child: WillPopScope(
                onWillPop: () => _onWillPopScope(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: dashBoardData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (MediaQuery.of(context).size.width /
                              MediaQuery.of(context).size.height *
                              1.8)),
                      itemBuilder: (BuildContext context, int index) {
                        return HomePageList(dataList: dashBoardData[index]);
                      }),
                ),
              ),
            ),
      //),
    );
  }

  _getHomeData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var id = pref.getString("id");
      var token = pref.getString("token");
      var fcmToken = pref.getString("FCM");
      print("id..." + id.toString());
      print("id..." + token.toString());
      print("id..." + fcmToken.toString());
      var params = "?restaurant_id=" + id.toString();
      var fcmparams =
          "?user_id=" + id.toString() + "&fcm_token=" + fcmToken.toString();
      var url = Const.dashboardHome + params;
      var fcmUpdateUrl = Const.updateFcm + fcmparams;
      var response = await Future.wait([
        dio.post(url,
            options: Options(headers: {"Authorization": "Bearer $token"})),
        dio.put(fcmUpdateUrl,
            options: Options(headers: {"Authorization": "Bearer $token"}))
      ]);
      print("response body..." + response[0].data.toString());
      print("response body..." + response[1].data.toString());
      dashBoardData = [
        {
          "image": "images/dollar.png",
          "total": "\u20B9${response[0].data["respData"]["total_earnings"]}",
          "type": " Total Earning"
        },
        {
          "image": "images/dollar.png",
          "total":
              "\u20B9${response[0].data["respData"]["todays_total_earnings"]}",
          "type": " Today's Earning"
        },
        {
          "image": "images/received.png",
          "total": "${response[0].data["respData"]["total_orders"]}",
          "type": "Total Orders"
        },
        {
          "image": "images/sent.png",
          "total": "${response[0].data["respData"]["todays_total_orders"]}",
          "type": "Today's Orders"
        },
        {
          "image": "images/discard.png",
          "total": "${response[0].data["respData"]["total_cancelled_orders"]}",
          "type": "Total Cancel Orders"
        },
        {
          "image": "images/discard.png",
          "total": "${response[0].data["respData"]["todays_cancelled_orders"]}",
          "type": "Today's Cancel Orders"
        }
      ];
      setState(() {
        homeLoad = true;
      });
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  _onWillPopScope() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure to exit?"),
              actions: [
                TextButton(
                    onPressed: () => exit(0),
                    child: Text(
                      "Yes",
                      style: TextStyle(color: AppColors.buttonColor),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      "No",
                      style: TextStyle(color: AppColors.buttonColor),
                    ))
              ],
            ));
  }

  fcmCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var fcm = pref.getString("FCM");
    print("Fcm in home page..." + fcm.toString());
    if (fcm == null) {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      SharedPreferences pref = await SharedPreferences.getInstance();
      FirebaseMessaging.instance.getToken().then((value) {
        print("val..." + value.toString());
        pref.setString("FCM", value.toString());
      });
      _getHomeData();
    } else {
      print("else running...");
      _getHomeData();
    }
  }
}
