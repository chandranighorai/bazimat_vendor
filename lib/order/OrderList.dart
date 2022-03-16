import 'package:bazimat_vendor_app/order/PendingModel.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  CartDetails cartData;
  OrderList({this.cartData, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text("${cartData.foodName}")),
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
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.035),
            )
          ],
        ),
      ),
    );
  }
}
