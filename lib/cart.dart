import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('\$${item.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Handle checkout
            },
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}
