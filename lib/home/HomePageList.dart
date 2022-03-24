import 'package:bazimat_vendor_app/order/OrderDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageList extends StatefulWidget {
  var dataList;
  HomePageList({this.dataList, Key key}) : super(key: key);

  @override
  _HomePageListState createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToPage(widget.dataList["type"].toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.02)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6.0)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,      
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.07,
                //width: MediaQuery.of(context).size.width / 7,
                child: Image.asset(widget.dataList["image"]),
                // decoration: BoxDecoration(
                //     color: Colors.amber,
                //     image: DecorationImage(
                //         image: AssetImage(widget.dataList["image"]))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                widget.dataList["total"],
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                widget.dataList["type"],
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  _goToPage(String type) {
    if (type == "Today's Orders") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderDetails()));
    }
  }
}
