import 'package:flutter/material.dart';

class BookModel {
  final String name;
  final int id;
  final double price;
  final String item;
  final String imgPath;
  final Color color;

  BookModel(
      {this.id, this.name, this.price, this.item, this.imgPath, this.color});

  static List<BookModel> list = [
    BookModel(
      id: 1,
      name: "A Drunkard's Tale",
      price: 120,
      item:
          "One of the popular, many tales told by the drinkers of Mondstadt. This drunkard is the one who told the lone wolf of an ancient story",
      imgPath: "1.png",
      color: Color(0xFFbb584e),
    ),
    BookModel(
      id: 2,
      name: "Ballads of the Squire",
      price: 100,
      item:
          "Ballads that have been passed down since the aristocratic period and are said to come from Ragnvindr the Dawn Knight himself. They tell of Ragnvindr's days as a knight's squire",
      imgPath: "2.png",
      color: Color(0xFFc3675f),
    ),
    BookModel(
      id: 3,
      name: "Breeze Amidst the Forest",
      price: 90,
      item:
          "A collection of Mondstadt ballads, recorded, compiled, and arranged by scholars centuries ago.",
      imgPath: "3.png",
      color: Color(0xFFbfad77),
    ),
    BookModel(
      id: 4,
      name: "Customs of Liyue",
      price: 50,
      item:
          "A book on the cultures and customs of Liyue originally compiled by Fadhlan, a scholar from Sumeru residing in Liyue. It was then edited by many local scholars and published. It is one of the bestsellers in Liyue.",
      imgPath: "4.png",
      color: Color(0xFFe2c990),
    ),
    BookModel(
      id: 5,
      name: "Diary of Roald the Adventurer",
      price: 20,
      item:
          "A diary left behind by the famed adventurer, Roald. The pages are littered with small amount of shiny but bitter salt crystals.",
      imgPath: "5.png",
      color: Color(0xFFab7d55),
    ),
    BookModel(
      id: 6,
      name: "Draft Hilichurl Ballads",
      price: 20,
      item:
          "Olah! Olah! Yoyo mosi mita! Nye, nye mosi mita, Yeye mosi gusha! Mosi gusha, mosi tiga, Yeye kucha kucha!",
      imgPath: "6.png",
      color: Color(0xFFe7e2d4),
    ),
    BookModel(
      id: 7,
      name: "Heart of Clear Springs",
      price: 20,
      item:
          "A legendary tale passed down by Springvale hunters that portrays an encounter between an unknown young boy and a spring fairy.",
      imgPath: "7.png",
      color: Color(0xFF92ebf8),
    ),
    BookModel(
      id: 8,
      name: "Heart's Desire",
      price: 20,
      item:
          "A collection of fantasy stories centered around a mysterious antique shop. It's widely popular around Teyvat.",
      imgPath: "8.png",
      color: Color(0xFF83b5b9),
    ),
    BookModel(
      id: 9,
      name: "Hex & Hound",
      price: 20,
      item:
          "A collection of fantasy stories centered around a mysterious antique shop. It's widely popular around Teyvat.",
      imgPath: "9.png",
      color: Color(0xFFdcc3f9),
    ),
    BookModel(
      id: 10,
      name: "Hilichurl Ballad Selection",
      price: 20,
      item:
          "The masterpiece of the Poet Laureate of Hilichurlian! Scholar Jacob Musk will show you the mysterious spiritual world of the hilichurls through this poetry collection!",
      imgPath: "10.png",
      color: Color(0xFFaa736e),
    ),
  ];
}
