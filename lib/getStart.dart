import 'package:bazimat_vendor_app/home/Home.dart';
import 'package:bazimat_vendor_app/login/LogIn.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key key}) : super(key: key);

  @override
  _GetStartState createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.width / 2,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("images/getstartimg.png"))),
              )),
          Positioned(
            top: MediaQuery.of(context).size.width / 0.87,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              "Hello, \n Bazimat Food Partner",
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.buttonColor,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.buttonColor)),
                  onPressed: _getStart,
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: MediaQuery.of(context).size.width * 0.7,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           //color: Colors.red,
      //           image: DecorationImage(
      //               image: AssetImage("images/getstartimg.png"))),
      //     ),
      //     SizedBox(
      //       height: MediaQuery.of(context).size.width * 0.02,
      //     ),
      //     Text(
      //       "Hello, \n Bazimat Food Partner",
      //       textAlign: TextAlign.center,
      //     ),
      //     //Spacer(),
      //     Align(
      //       alignment: FractionalOffset.bottomCenter,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         color: AppColors.buttonColor,
      //         child: ElevatedButton(
      //             onPressed: null,
      //             child: Text(
      //               "Get Started",
      //               style: TextStyle(
      //                   color: Colors.white, fontWeight: FontWeight.bold),
      //             )),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  _getStart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    print("Token.." + token.toString());
    if (token == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
