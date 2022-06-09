import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/cart.dart';
import 'package:e_comm/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:e_comm/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  int cartItem = 0;
  double myWidth(BuildContext context, int percent) {
    var screenSize = MediaQuery.of(context).size;
    return (screenSize.width) * percent / 100;
  }

  Widget createCard() {
    Widget card = Card(
      color: const Color.fromARGB(255, 249, 248, 243),
      child: SizedBox(
        width: myWidth(context, 40),
        height: 120 + 10 * myWidth(context, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120 + myWidth(context, 5),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("img/comp.jpg"))),
            ),
            // AspectRatio(
            //   aspectRatio: 16 / 11,
            //   child: ,
            // ),
            Text(
              "A best Product",
              style: TextStyle(
                  fontSize: 10 + myWidth(context, 2),
                  fontFamily: "Libre_Baskerville",
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text(
                  "@150/",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 189, 144, 11),
                      fontSize: myWidth(context, 3)),
                ),
                Text(
                  " kg",
                  style: TextStyle(
                      color: Colors.cyan, fontSize: myWidth(context, 3)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: myWidth(context, 10)),
                  child: const Text(
                    "4.5",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
              ],
            ),
          ],
        ),
      ),
    );
    return card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sre- A online Site"),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            icon: const Icon(Icons.menu)),
        actions: [
          Stack(
            textDirection: TextDirection.ltr,
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                color: Colors.amber,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "$cartItem",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      "img/try1.jpg",
                    ),
                    Image.asset(
                      "img/try2.jpg",
                    ),
                    Image.asset(
                      "img/try3.jpg",
                    ),
                  ],
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex += 1;
                        });
                      }),
                ),
                Container(
                    child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex % 5, count: 5)),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Our Recomendation :- ",
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Roboto",
                        fontSize: 45.0),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                cartItem += 1;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductDetails()));
                              });
                            },
                            child: createCard()),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createCard(),
                        createCard(),
                      ],
                    ),
                  ],
                ),
              ])),
        ]),
      ),
    );
  }
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String val = "1";
  int price = 319;

  List<String> items = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  int _value = 1;
  List<int> list_items = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Product Detail",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Playfair_Display",
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "img/try1.jpg",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "   A Best Product",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: "Roboto",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "  Rs.319/kg",
                      style: TextStyle(
                        fontFamily: "Rubik_Wet_Paint",
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 42.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 192, 193, 193),
                        borderRadius: BorderRadius.circular(9.0)),
                    child: DropdownButton(
                      // elevation: 1,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      borderRadius: BorderRadius.circular(15.0),
                      value: _value,
                      items: list_items.map((int item) {
                        return DropdownMenuItem<int>(
                          child: Text('$item kg'),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (int? value) {
                        setState(() {
                          price = 319 * _value;
                          _value = value!;
                        });
                      },
                      hint: const Text("Select item"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Total: "),
                    Text(
                      "   Rs. " + (_value * price).toString(),
                      style: const TextStyle(
                        fontFamily: "Libre_Baskerville",
                        color: Color.fromARGB(255, 44, 31, 30),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 45.0, left: 12.0),
                      child: FlatButton.icon(
                        onPressed: () {
                          _HomeState().cartItem += 1;
                        },
                        icon: const Icon(Icons.add_shopping_cart_rounded),
                        label: const Text(
                          "Save for later",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: const Color.fromARGB(255, 179, 26, 79),
                        colorBrightness: Brightness.light,
                        height: 45.0,
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_checkout_sharp),
                      label: const Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: const Color.fromARGB(255, 161, 197, 65),
                      colorBrightness: Brightness.light,
                      height: 45.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 251, 184)),
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Product Discription :",
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 15.0),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "This is the product made by self and with the natural item that are benificial for your health",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 176, 176, 167)),
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Plant Details :",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 253, 255),
                                      fontSize: 15.0),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "MFG - SHRI RAM ENTERPRISES ~ Basantpatti Chowk Sheohar Road 843334 ,Bihar ,India",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                    TableRow(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 251, 184)),
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Imaportant Notice* :",
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 15.0),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Currently Our Only One shop is running. Please avoid to be cheated.",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}
