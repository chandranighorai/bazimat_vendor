import 'package:bazimat_vendor_app/order/PendingList.dart';
import 'package:bazimat_vendor_app/order/PendingModel.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  Future<PendingModel> _pendingOrderList;
  var dio = Dio();

  _onRefresh() {
    Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _pendingOrderList = _getPendingOrderList();
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => PendingOrder()),
      //     (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    _pendingOrderList = _getPendingOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pending Order"),
      // ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: FutureBuilder(
            initialData: null,
            future: _pendingOrderList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var respData = snapshot.data.respData;
                //var resturentList = snapshot.data.respData.restaurants;
                print("respData..." + respData.length.toString());
                // print("resturent..." + resturentList.toString());
                return respData.length == 0
                    ? Center(
                        child: Text(
                          "No Order Found",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: respData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PendingList(
                              resturentData: respData[index],
                              allData: fetchData);
                        });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  fetchData() {
    print("fetchData...");
    setState(() {
      _pendingOrderList = _getPendingOrderList();
    });
  }

  Future<PendingModel> _getPendingOrderList() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      String id = pref.getString("id");
      print("token..." + token.toString());
      print("id..." + id.toString());
      var params = "?restaurant_id=" + id;
      var url = Const.pendingOrder + params;
      print("Response body..." + url.toString());
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print("Response body..." + response.data.toString());
      if (response.data['state'] == 0) {
        //setState(() {
        return PendingModel.fromJson(response.data);
        // });
      } else {
        showCustomToast(response.data["errors"][0]["message"]);
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
