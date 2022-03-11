import 'package:bazimat_vendor_app/order/DeliveredList.dart';
import 'package:bazimat_vendor_app/order/DeliveredModel.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveredOrder extends StatefulWidget {
  const DeliveredOrder({Key key}) : super(key: key);

  @override
  _DeliveredOrderState createState() => _DeliveredOrderState();
}

class _DeliveredOrderState extends State<DeliveredOrder> {
  Future<DeliveredModel> _getDeliveredData;
  var dio = Dio();
  @override
  void initState() {
    super.initState();
    _getDeliveredData = _allDeliveredData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Delivered"),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: FutureBuilder(
          initialData: null,
          future: _allDeliveredData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //var data = snapshot.data.respData.restaurants;
              var respData = snapshot.data.respData;
              print("respData..." + respData.length.toString());
              //print("dasta..." + data.length.toString());
              return respData.length == 0
                  ? Center(
                      child: Text(
                        "No Order Found",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: respData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DeliveredList(dataList: respData[index]);
                      });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<DeliveredModel> _allDeliveredData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      var id = pref.getString("id");
      var params = "?restaurant_id=" + id.toString();
      print("token..." + token.toString());
      print("token..." + id.toString());
      var url = Const.completedOrder + params;
      print("token..." + url.toString());
      var response = await dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.data["state"] == 0) {
        return DeliveredModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
