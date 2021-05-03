import 'package:app_book_store/core/consts.dart';
import 'package:app_book_store/core/flutter_icons.dart';
import 'package:app_book_store/models/book_model.dart';
import 'package:app_book_store/pages/pay_page.dart';
import 'package:flutter/material.dart';
import 'package:app_book_store/pages/detail_page.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  LocationResult _pickedLocation;
  @override
  Widget build(BuildContext context) {
    List<BookModel> foodList = BookModel.list;
    int listcount = 1;
    final children = <Widget>[];
    foodList.forEach((count) {
      if (pcount[foodList.indexOf(count)] > 0) {
        children.add(Container(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.brownColor.withOpacity(.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //tag: "image${foodList[index].imgPath}",
                          child: Image(
                            width: 100,
                            image: AssetImage("assets/${count.imgPath}"),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${count.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF603814),
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "\฿ ${getTotalAmount(count.price * pcount[foodList.indexOf(count)])}",
                                    style: TextStyle(
                                        color: Color(0xFF603814),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "x ${pcount[foodList.indexOf(count)]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(""),
                                )
                              ],
                            ),
                          ],
                        )),
                        Container(
                          //tag: "image${foodList[index].imgPath}",
                          child: IconButton(
                              onPressed: () {
                                if (pcount[foodList.indexOf(count)] > 0) {
                                  setState(() {
                                    totalAmount -= count.price;

                                    if (totalAmount <= 0) {
                                      totalAmount = 0;
                                    }
                                  });
                                }
                                pcount[foodList.indexOf(count)]--;
                                if (pcount[foodList.indexOf(count)] <= 0) {
                                  pcount[foodList.indexOf(count)] = 0;
                                }
                              },
                              icon: Icon(Icons.delete, color: Colors.black45)),
                        ),
                      ]))
            ],
          ),
        ));
        listcount++;
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Icon(
                    FlutterIconsHome.left,
                    size: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                ),
                onPressed: () {
                  setState(() {
                    totalAmount = 0;
                    for (int i = 0; i < pcount.length; i++) {
                      pcount[i] = 0;
                    }
                  });
                },
                child: new Text(
                  'Clear All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.brownColor.withOpacity(.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Container(
                  //   //tag: "image${foodList[index].imgPath}",
                  //   child: Image(
                  //     width: 100,
                  //     image: AssetImage("assets/${count.imgPath}"),
                  //   ),
                  // ),
                  SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //color: Color(0xFF603814),
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Salaya, Thailand",
                              style: TextStyle(
                                  //color: Color(0xFF603814),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Subtotal:  ${getTotalAmount(totalAmount)}฿",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF603814)),
                      ),
                      Text(
                        "Shipping Fee:  40฿",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF603814)),
                      ),
                    ],
                  )),
                  Container(
                    //tag: "image${foodList[index].imgPath}",
                    child: IconButton(
                        onPressed: () async {
                          LocationResult result = await showLocationPicker(
                            context,
                            'AIzaSyBBJg4-WzVIofINywQsoN3QdHiIF1sCJeY',
                            initialCenter: LatLng(13.736717, 100.523186),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                            myLocationButtonEnabled: true,
                            // requiredGPS: true,
                            layersButtonEnabled: true,
                            // countries: ['AE', 'NG']

//                      resultCardAlignment: Alignment.bottomCenter,
                            desiredAccuracy: LocationAccuracy.best,
                          );
                          print("result = $result");
                          setState(() => _pickedLocation = result);
                        },
                        icon: Icon(Icons.add, color: Colors.black45)),
                  ),
                ])),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Column(
                      children: children,
                    ),
                  ],
                );
              }),
        ),
      ]),
      bottomNavigationBar: Container(
        color: Color(0xFFEAE1D2),
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Total:    ${getTotalAmount(totalAmount + 40)}฿",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF603814)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFC48758)),
              ),
              onPressed: () {
                setState(() {
                  totalAmount = 0;
                  for (int i = 0; i < pcount.length; i++) {
                    pcount[i] = 0;
                  }
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Payment(),
                  ),
                );
              },
              child: new Text(
                'Pay',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getTotalAmount(double totalAmount) {
  return (totalAmount).toStringAsFixed(1);
}
