import 'package:bazimat_vendor_app/home/Home.dart';
import 'package:bazimat_vendor_app/login/LogIn.dart';
import 'package:bazimat_vendor_app/order/OrderDetails.dart';
import 'package:bazimat_vendor_app/settings/Settings.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.45,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: DrawerHeader(
                  child: Container(
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width / 6,
                //color: Colors.white,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("images/logo.png"))),
              )),
            ),
            SizedBox(),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                  //visualDensity: ,
                  title: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.06,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage("images/house.png"))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                  //visualDensity: ,
                  title: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.06,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage("images/todolist.png"))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Order History",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetails()));
                  },
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                  title: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.06,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage("images/settings.png"))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                  title: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.06,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage("images/logout.png"))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ],
                  ),
                  onTap: () => _logout(),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  _logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LogIn()), (route) => false);
  }
}
