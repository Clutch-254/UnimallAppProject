import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Selected category index
  int _selectedCategoryIndex = 0;

  // Categories for the sidebar
  final List<Map<String, dynamic>> categories = [
    {'name': 'Jewelry', 'icon': Icons.diamond},
    {'name': 'Top', 'icon': Icons.face},
    {'name': 'Lower Body', 'icon': Icons.accessibility},
    {'name': 'Shoes', 'icon': Icons.rowing},
    {'name': 'Combo', 'icon': Icons.style},
  ];

  // Sample data for featured items (horizontal scroll)
  final List<Map<String, dynamic>> featuredItems = [
    {'name': 'New Arrivals', 'image': 'assets/images/new_arrivals.jpg'},
    {'name': 'Best Sellers', 'image': 'assets/images/best_sellers.jpg'},
    {'name': 'Sale', 'image': 'assets/images/sale.jpg'},
    {'name': 'Trending', 'image': 'assets/images/trending.jpg'},
    {'name': 'Collections', 'image': 'assets/images/collections.jpg'},
  ];

  // Sample data for product items (vertical scroll)
  final List<Map<String, dynamic>> productItems = [
    {
      'name': 'Gold Necklace',
      'image': 'assets/images/gold_necklace.jpg',
      'price': '\Ksh129',
      'category': 0
    },
    {
      'name': 'Gold Necklace',
      'image': 'assets/images/gold_necklace.jpg',
      'price': '\Ksh129',
      'category': 0
    },
    {
      'name': 'Silver Earrings',
      'image': 'assets/images/silver_earrings.jpg',
      'price': '\Ksh49',
      'category': 0
    },
    {
      'name': 'Silver Earrings',
      'image': 'assets/images/silver_earrings.jpg',
      'price': '\Ksh49',
      'category': 0
    },
    {
      'name': 'Casual Shirt',
      'image': 'assets/images/casual_shirt.jpg',
      'price': '\Ksh29',
      'category': 1
    },
    {
      'name': 'Casual Shirt',
      'image': 'assets/images/casual_shirt.jpg',
      'price': '\Ksh29',
      'category': 1
    },
    {
      'name': 'Summer T-Shirt',
      'image': 'assets/images/summer_tshirt.jpg',
      'price': '\Ksh19',
      'category': 1
    },
    {
      'name': 'Summer T-Shirt',
      'image': 'assets/images/summer_tshirt.jpg',
      'price': '\Ksh19',
      'category': 1
    },
    {
      'name': 'Jeans',
      'image': 'assets/images/jeans.jpg',
      'price': '\Ksh39',
      'category': 2
    },
    {
      'name': 'Jeans',
      'image': 'assets/images/jeans.jpg',
      'price': '\Ksh39',
      'category': 2
    },
    {
      'name': 'Shorts',
      'image': 'assets/images/shorts.jpg',
      'price': '\Ksh24',
      'category': 2
    },
    {
      'name': 'Shorts',
      'image': 'assets/images/shorts.jpg',
      'price': '\Ksh24',
      'category': 2
    },
    {
      'name': 'Running Shoes',
      'image': 'assets/images/running_shoes.jpg',
      'price': '\$59.99',
      'category': 3
    },
    {
      'name': 'Running Shoes',
      'image': 'assets/images/running_shoes.jpg',
      'price': '\$59.99',
      'category': 3
    },
    {
      'name': 'Formal Shoes',
      'image': 'assets/images/formal_shoes.jpg',
      'price': '\Ksh79.',
      'category': 3
    },
    {
      'name': 'Formal Shoes',
      'image': 'assets/images/formal_shoes.jpg',
      'price': '\Ksh79.',
      'category': 3
    },
    {
      'name': 'Summer Outfit',
      'image': 'assets/images/summer_outfit.jpg',
      'price': '\Ksh89.99',
      'category': 4
    },
    {
      'name': 'Summer Outfit',
      'image': 'assets/images/summer_outfit.jpg',
      'price': '\Ksh89.99',
      'category': 4
    },
    {
      'name': 'Winter Outfit',
      'image': 'assets/images/winter_outfit.jpg',
      'price': '\Ksh109',
      'category': 4
    },
    {
      'name': 'Winter Outfit',
      'image': 'assets/images/winter_outfit.jpg',
      'price': '\Ksh109',
      'category': 4
    },
  ];

  // Get filtered products based on selected category
  List<Map<String, dynamic>> get filteredProducts {
    return productItems
        .where((item) => item['category'] == _selectedCategoryIndex)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Fashion Store',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Grey sidebar with categories
          Container(
            width: 80,
            color: Colors.grey[300],
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: _selectedCategoryIndex == index
                          ? Colors.grey[400]
                          : Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[400]!,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Placeholder image container
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            categories[index]['icon'],
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: _selectedCategoryIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Main content area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured items - horizontal scrolling
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Featured ${categories[_selectedCategoryIndex]['name']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemCount: featuredItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  featuredItems[index]['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              featuredItems[index]['name'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Divider
                Divider(color: Colors.grey[300]),

                // Products heading
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'All ${categories[_selectedCategoryIndex]['name']} Items',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),

                // Products grid - vertical scrolling
                Expanded(
                  child: filteredProducts.isEmpty
                      ? Center(
                          child: Text(
                            'No items in this category yet',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.all(12.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product image
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(8),
                                        ),
                                      ),
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(8),
                                        ),
                                        child: Image.asset(
                                          filteredProducts[index]['image'],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 40,
                                                color: Colors.grey[500],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Product details
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          filteredProducts[index]['name'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          filteredProducts[index]['price'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
