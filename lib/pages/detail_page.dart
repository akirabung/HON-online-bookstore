import 'package:app_food_delivery/core/consts.dart';
import 'package:app_food_delivery/core/flutter_icons.dart';
import 'package:app_food_delivery/models/food_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _customAppBar(),
          Container(
            height: 270,
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
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     _buildInfo("Weight", "${widget.data.weight.toInt()}gm"),
                  //     _buildInfo(
                  //         "Calories", "${widget.data.calory.toInt()}ccal"),
                  //     _buildInfo("Protein", "${widget.data.protein.toInt()}gm"),
                  //   ],
                  // ),
                  SizedBox(height: 5),
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("${widget.data.item}"),
                  Expanded(child: SizedBox()),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {},
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(vertical: 7),
                  //           primary: AppColors.greenColor,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(18),
                  //             ),
                  //           ),
                  //         ),
                  //         child: Text(
                  //           "Add to Cart",
                  //           style: TextStyle(
                  //             fontSize: 28,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 13),
            primary: AppColors.brownColor,
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

  Widget _buildInfo(String title, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$val",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
          ),
        ),
      ],
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
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIconsHome.shop,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brownColor.withOpacity(.5),
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
