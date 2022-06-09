import 'package:e_comm/home.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int sum = 0;
  List<String> product_name = [
    "Murmure",
    "White Powder",
    "Notebook",
    "Bottle",
    "laptop",
    "White Powder",
    "Notebook",
    "Bottle",
    "laptop"
  ];
  List<int> price = [40, 80, 26, 35, 40000, 80, 26, 35, 40000];
  List<int> total = [40, 80, 26, 35, 40000, 80, 26, 35, 40000];
  List<int> time = [1, 1, 1, 1, 1, 1, 1, 1, 1];

  int nu = 1;
  Widget cartCard(int index) {
    Widget card = Card(
      color: Color.fromARGB(255, 240, 235, 235),
      shadowColor: Color.fromARGB(255, 243, 224, 167),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (product_name.length == 1) {}
                product_name.removeAt(index);
                price.removeAt(index);
                total.removeAt(index);
                time.removeAt(index);
              });
            },
            icon: Icon(Icons.delete)),
        Container(
          height: 80,
          width: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("img/comp.jpg"))),
        ),
        Container(
          width: 175,
          child: Column(
            children: [
              Text(
                product_name[index],
                style: const TextStyle(
                    color: Colors.green,
                    fontFamily: "mg",
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Text(
                "Rs. " + price[index].toString(),
                style: const TextStyle(
                    color: Color.fromARGB(255, 50, 56, 50),
                    fontFamily: "mg",
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    time[index] += 1;
                    total[index] += price[index];
                  });
                },
                icon: Icon(Icons.add_circle_outline)),
            Text(time[index].toString()),
            IconButton(
                onPressed: () {
                  setState(() {
                    time[index] -= 1;
                    total[index] -= price[index];
                    if (time[index] == 0) {
                      product_name.removeAt(index);
                      price.removeAt(index);
                      total.removeAt(index);
                      time.removeAt(index);
                    }
                  });
                },
                icon: Icon(Icons.remove_circle_outline))
          ],
        )
      ]),
    );

    return card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            icon: Icon(Icons.close)),
        title: Text("Your cart"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: product_name.length,
              itemBuilder: ((context, index) => cartCard(index))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total:  ",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.black,
                        fontSize: 45.0),
                  ),
                  Text(
                    total
                        .reduce((value, element) => value + element)
                        .toString(),
                    style: TextStyle(
                        fontFamily: "Lobster",
                        color: Color.fromARGB(255, 158, 3, 3),
                        fontSize: 30.0),
                  ),
                ],
              ),
              Container(
                  height: 50,
                  width: 300.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Check-out",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(252, 254, 250, 250))),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
