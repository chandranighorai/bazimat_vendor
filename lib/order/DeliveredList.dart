import 'dart:convert';
import 'package:bazimat_vendor_app/order/DeliverDataList.dart';
import 'package:bazimat_vendor_app/order/DeliveredModel.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';

class DeliveredList extends StatelessWidget {
  RespData dataList;
  DeliveredList({this.dataList, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var address = json.decode(dataList.deliveryAddress);
    print("Addr..." + address["address"].toString());
    print("boy name..." + dataList.deliveryBoyDetails.length.toString());
    return Card(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "#${dataList.id}",
              style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "${address["address"]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.035),
                  ),
                ),
                Spacer(),
                Text(
                  "${dataList.createdAt}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                ),
              ],
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.01,
            // ),
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
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.cartDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DeliverDataList(
                        cartData: dataList.cartDetails[index]);
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  //color: Colors.amber,
                  child: Text(
                    dataList.deliveryBoyDetails.length == 0
                        ? ""
                        : "Deliver Boy Name: " +
                            dataList.deliveryBoyDetails[0].fName +
                            " " +
                            // " jkjkjkjkjkjkkkkkkkkkkkkkkkkkkk",
                            dataList.deliveryBoyDetails[0].lName,
                    //"Delivered by: ${dataList.deliveryBoyName}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.grey),
                  ),
                ),
                // Spacer(),
                // Text(
                //   "27/2/2022",
                //   style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.width * 0.028,
                //       color: Colors.grey),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
