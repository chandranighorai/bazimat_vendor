import 'dart:convert';
import 'package:bazimat_vendor_app/order/OrderList.dart';
import 'package:bazimat_vendor_app/order/PendingModel.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:bazimat_vendor_app/utils/AppConst.dart';
import 'package:bazimat_vendor_app/utils/Const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PendingList extends StatefulWidget {
  RespData resturentData;
  Function() allData;
  PendingList({this.resturentData, this.allData, Key key}) : super(key: key);

  @override
  _PendingListState createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  String dropdownvalue = "Select";
  bool _accept, _cancel;
  var dio = Dio();
  //var items = ["Select", "Processing", "Handover"];
  var items = ["Select"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accept = false;
    _cancel = false;
  }

  @override
  void dispose() {
    super.dispose();
    items.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("delivery ddress..." +
        json.decode(widget.resturentData.deliveryAddress).length.toString());
    var deliveryAddr = json.decode(widget.resturentData.deliveryAddress);
    print("deliveryAddddr..." + deliveryAddr['address'].toString());
    print("deliveryAddddr..." + widget.resturentData.id.toString());
    print("orderStatus..." + widget.resturentData.orderStatus.toString());
    print("Items..." + items.toString());
    if (widget.resturentData.orderStatus == "accepted") {
      //if (!items.contains("Processing")) {
      items.clear();
      items = ["Select", "Processing"];
      dropdownvalue = items[1];
      //items.add("Processing");
      print("Items..n processing..." + items.toString());
      //}
      //print("Items.." + items.toString());
    } else {
      print("Items in handover..." + items.toString());
      if (!items.contains("Handover")) {
        items.clear();
        items = ["Select", "Handover"];
        dropdownvalue = items[1];
        //items.add("Handover");
        print("Items.." + items.toString());
      } else {
        items.clear();
        items = ["Select", "Handover"];
        dropdownvalue = items[1];
        //items.remove("Processing");
      }
    }

    // if (widget.resturentData.orderStatus == "accepted" ||
    //     widget.resturentData.orderStatus == "processing") {
    //   //setState(() {
    //   _accept = true;
    //   //});
    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.02)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        ),
        //height: MediaQuery.of(context).size.width * 0.06,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${widget.resturentData.id}",
                style: TextStyle(
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      deliveryAddr['address'].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.035),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${widget.resturentData.createdAt}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width / 1.5,
              //   child: Text(
              //     "SDF Building, 4th Floor, Bidhannagar, kolkata, West Bengal 700091",
              //     style: TextStyle(
              //         color: Colors.grey,
              //         fontSize: MediaQuery.of(context).size.width * 0.03),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                //height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: widget.resturentData.cartDetails.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return OrderList(
                        cartData: widget.resturentData.cartDetails[index]);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Divider(),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Amount: ",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            "(Including Tax + Delivery Charge)",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                          )
                        ],
                      )),
                  Spacer(),
                  Text(
                    "\u20B9${widget.resturentData.orderAmount}",
                    style: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              (widget.resturentData.orderStatus == "pending")
                  ? Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _updateStatus("accepted");
                          },
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.06,
                                  right:
                                      MediaQuery.of(context).size.width * 0.06),
                              decoration: BoxDecoration(
                                  color: AppColors.acceptColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              50))),
                              child: Text(
                                "Accept",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            _updateStatus("rejected");
                            //widget.allData();
                          },
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.06,
                                  right:
                                      MediaQuery.of(context).size.width * 0.06),
                              decoration: BoxDecoration(
                                  color: AppColors.cancelColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              50))),
                              child: Text(
                                "Reject",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    )
                  : SizedBox(),
              (widget.resturentData.orderStatus == "rejected" ||
                      widget.resturentData.orderStatus == "pending")
                  ? SizedBox()
                  : Row(
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        DropdownButton(
                          value: dropdownvalue,
                          items: items.map((String items) {
                            print(
                                "items in dropdownList..." + items.toString());
                            return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                ));
                          }).toList(),
                          onChanged: (String newValue) {
                            print("new..." + newValue);
                            setState(() {
                              dropdownvalue = newValue;
                              print("new...in val.." + dropdownvalue);
                            });
                          },
                        ),
                        Spacer(),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.buttonColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)))),
                            // ElevatedButton.styleFrom(
                            //   primary: AppColors.buttonColor,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(30)),
                            // ),

                            onPressed: () {
                              print("dropDown..." +
                                  dropdownvalue.toLowerCase().toString());
                              _updateStatus(dropdownvalue.toLowerCase());
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
              (_cancel == false &&
                      widget.resturentData.orderStatus != "rejected")
                  ? SizedBox()
                  : Text(
                      "Order has cancelled",
                      style: TextStyle(
                          color: AppColors.cancelColor,
                          fontWeight: FontWeight.bold),
                    )
            ],
          ),
        ),
      ),
    );
  }

  _updateStatus(String statusValue) async {
    print("statusVal..." + statusValue.toString());
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      var params = "?order_id=" +
          widget.resturentData.id.toString() +
          "&status=" +
          statusValue;
      var url = Const.orderUpdate + params;
      print("Url..." + url.toString());
      var response = await dio.put(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      print("response..." + response.data.toString());
      if (response.data["state"] == 0) {
        showCustomToast(response.data["message"]);
        widget.allData();
        items.clear();
        // setState(() {
        //   widget.allData();
        // });
        // if (statusValue == "rejected") {
        //   setState(() {
        //     _cancel = true;
        //     _accept = false;
        //   });
        // } else {
        //   setState(() {
        //     _accept = true;
        //   });
        // }
      } else {
        //print("kkkkkk...." + response.data['errors'][0]['message'].toString());
        showCustomToast(response.data['errors'][0]['message']);
      }
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
