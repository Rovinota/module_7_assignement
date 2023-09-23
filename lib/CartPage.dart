import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
  final List<ProductDetails> product;
  final int total_buy;

  CartPage({Key? key, required this.product, required this.total_buy}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.separated(
        itemCount: widget.product.length,
        itemBuilder: (context, index) {
          final product = widget.product[index];
          int total_price = product.price! * product.count;
          return ListTile(
            title: Text(product.name!),
            subtitle: Text("Total Price: ${total_price.toString()} Taka"),
            trailing: Text("Quantity: ${product.count.toString()}"),
          );
        }, separatorBuilder: (BuildContext context, int index) =>Divider(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Total Bought: ${widget.total_buy}",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ProductDetails {
   String? name;
   int? price ;
   int count = 0 ;
  ProductDetails(this.name,  this.price, this.count);
}