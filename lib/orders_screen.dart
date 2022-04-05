import 'package:flutter/material.dart';
import 'order.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({Key? key, required this.orders}) : super(key: key);
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'Handlee',
            fontSize: 30.0,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.amber[100],
      ),
      body: SafeArea(
        child: Center(
          child: ListView.separated(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(10.0),
                leading: const Icon(
                  Icons.icecream,
                  color: Colors.pink,
                ),
                title: Text(orders[index].toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ),
    );
  }
}
