import 'package:app_book_store/core/consts.dart';
import 'package:app_book_store/core/flutter_icons.dart';
import 'package:app_book_store/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:app_book_store/pages/cart_page.dart';

double totalAmount = 0.0;
List<int> pcount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class DetailPage extends StatefulWidget {
  final BookModel data;
  //
  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.data.color, //AppColors.brownColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _customAppBar(),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                // Image(
                //   image: AssetImage("assets/bg.png"),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: "image${widget.data.imgPath}",
                    child: Image(
                      image: AssetImage("assets/${widget.data.imgPath}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.data.name}",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$${widget.data.price.toInt()}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 30),
                      _buildCounter(),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("${widget.data.item}"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 13, left: 13, right: 13),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              totalAmount += widget.data.price;
              //totalAmount = roundDouble(totalAmount, 2);
              pcount[widget.data.id - 1]++;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 13),
            primary: widget.data.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
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
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Purchase(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  FlutterIconsHome.shop,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: widget.data.color.withOpacity(.5),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
