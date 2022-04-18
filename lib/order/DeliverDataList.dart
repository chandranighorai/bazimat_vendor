import 'package:bazimat_vendor_app/order/DeliveredModel.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';

class DeliverDataList extends StatelessWidget {
  CartDetails cartData;
  DeliverDataList({this.cartData, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.06,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(
        //       Radius.circular(MediaQuery.of(context).size.width * 0.02)),
        //   color: Colors.white,
        //   boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text("${cartData.foodName}")),
            //Spacer(),
            Container(
                alignment: Alignment.centerRight,
                //color: Colors.red,
                width: MediaQuery.of(context).size.width / 4,
                child: Text("Qty: x${cartData.quantity}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03))),
            Spacer(),
            Text(
              "\u20B9${cartData.foodAmount}",
              style: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
