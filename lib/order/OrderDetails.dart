import 'package:bazimat_vendor_app/order/DeliveredOrder.dart';
import 'package:bazimat_vendor_app/order/PendingOrder.dart';
import 'package:bazimat_vendor_app/utils/AppColors.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          title: Text(
            "Order History",
            style: TextStyle(color: AppColors.buttonColor),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.buttonColor,
            tabs: [
              Tab(
                  child: Text(
                "Pending",
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                  child: Text(
                "Complete",
                style: TextStyle(color: Colors.black),
              ))
            ],
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [PendingOrder(), DeliveredOrder()]),
      ),
    );
  }
}
