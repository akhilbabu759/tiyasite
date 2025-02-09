import 'package:flutter/material.dart';
import 'package:myapp/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/firebase_options.dart' show DefaultFirebaseOptions;
void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(EarringsShopApp());
}

class EarringsShopApp extends StatelessWidget {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Item 1',
      imageUrl: 'https://via.placeholder.com/150',
      quantity: 1,
      price: 10.0,
    ),
    CartItem(
      name: 'Item 2',
      imageUrl: 'https://via.placeholder.com/150',
      quantity: 2,
      price: 15.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tiya Earrings',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pinkAccent,
          actions: [
            IconButton(
                onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage(cartItems: cartItems,),
                          ));},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              EarringsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.pink[50],
      child: Column(
        children: [
          Text(
            'Discover Beautiful Earrings',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Shop Now',
                style: TextStyle(color: Colors.white),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
            ),
          ),
        ],
      ),
    );
  }
}

class EarringsGrid extends StatelessWidget {
  final List<String> earringImages = [
    'assets/WhatsApp Image 2025-01-29 at 11.54.02 AM.jpeg',
    'assets/WhatsApp Image 2025-01-29 at 11.54.03 AM (1).jpeg',
    'assets/WhatsApp Image 2025-01-29 at 11.54.03 AM.jpeg',
    'assets/WhatsApp Image 2025-01-29 at 11.54.04 AM.jpeg',
  ];
   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 2 : 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: earringImages.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateX(0.1) // Rotate around X-axis
                    ..rotateY(0.3), // Rotate around Y-axis
                  alignment: FractionalOffset.center,
                  child: Container(
                      height: MediaQuery.sizeOf(context).width * 0.3,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 7),
                            BoxShadow(
                                color: const Color.fromARGB(255, 225, 224, 224),
                                blurRadius: 6)
                          ]),
                      child: Image.network(
                        earringImages[index],
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(height: 5),
                Text('Earring ${index + 1}'),
                Text(
                  'Earrings are a popular form of jewelry worn on the earlobes. They come in various styles, including studs, hoops, and dangles, and can be made from a wide range of materials such as gold, silver, diamonds, and gemstones. Earrings have been worn for centuries across different cultures for both decorative and symbolic purposes, often reflecting personal style and cultural heritage.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 177, 55, 145)),
                        onPressed: () {
                         
                        },
                        child: Text(
                          'Add To cart',
                          style: TextStyle(color: Colors.white),
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}
