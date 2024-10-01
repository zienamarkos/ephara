import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Cart Page (Placeholder)
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // Categories
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryItem('Electronics', Icons.devices),
                categoryItem('Fashion', Icons.shopping_bag),
                categoryItem('Home', Icons.home),
                categoryItem('Beauty', Icons.face),
                categoryItem('Sports', Icons.sports),
              ],
            ),
          ),
          // Product Grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Text(
              'Popular Products',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 5, // Number of products
              itemBuilder: (context, index) {
                List<String> productImages = [
                  'assets/galaxy-s24.jpg',
                  'assets/fem-shoes.png',
                  'assets/image.png',
                  'assets/sports.jpg',
                  'assets/beauty.webp',
                ];
                return productCard(
                    'Product ${index + 1}', productImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Category Item Widget
  Widget categoryItem(String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }

  // Product Card Widget
  Widget productCard(String name, String imagePath) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$49.99'), // Product Price
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add to Cart (Placeholder)
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
