import 'package:flutter/material.dart';
import 'package:module_7_assignement/CartPage.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  List<int> productPrice = [
    18000,
    15000,
    26000,
    20000,
    30000,
  ];
  List<String> productName = [
    "Redmi Note 12",
    "Redmi Note 10",
    "Redmi Note 12 Pro",
    "Redmi Note 11",
    "Redmi Note 11 Pro",
  ];
  List<int> productCount = [0, 0, 0, 0, 0];
  int total_buy = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                productName[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.phone_android_sharp,
                color: Colors.black87,
              ),
              subtitle: Text(
                "Price: " + productPrice[index].toString() + " Taka",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Count: " + productCount[index].toString()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (productCount[index] == 0)total_buy = total_buy + 1;
                        productCount[index] = productCount[index] + 1;

                        if (productCount[index] == 5) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(

                                  content: Text(
                                      "Congratulations!!\nYou Have Bought:  5\n" +
                                          "Product Name: " + productName[index]),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                        }
                        setState(() {});
                      },
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          List <product2> productdetails = [];
          for (int i = 0;  i < productCount.length; i++) {

              if (productCount[i] > 0) {
                productdetails.add(product2(productName[i], productPrice[i], productCount[i]));
              }

          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(product: productdetails, total_buy: total_buy) ));
          setState(() {

          });
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
class product2 extends ProductDetails {
  product2(super.name, super.price, super.count);
}
