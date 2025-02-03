import 'package:flutter/material.dart';

void main() {
  runApp(EarringsShopApp());
}

class EarringsShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tiya Earrings'),
          backgroundColor: Colors.pinkAccent,
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
          ElevatedButton(
            onPressed: () {},
            child: Text('Shop Now'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
          ),
        ],
      ),
    );
  }
}

class EarringsGrid extends StatelessWidget {
  final List<String> earringImages = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: earringImages.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(earringImages[index]),
                SizedBox(height: 5),
                Text('Earring ${index + 1}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
