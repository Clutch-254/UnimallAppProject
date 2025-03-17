import 'package:flutter/material.dart';

// Model for shopping items
class ShopItem {
  final String id;
  final String name;
  final double price; // Price in Kenyan Shillings
  final String imageUrl;
  final bool isLimited;
  final int availableQuantity;
  final int estimatedDeliveryDays;
  int quantity;

  ShopItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isLimited,
    required this.availableQuantity,
    required this.estimatedDeliveryDays,
    this.quantity = 1,
  });
}

class Orderhire extends StatefulWidget {
  const Orderhire({super.key});

  @override
  State<Orderhire> createState() => _OrderhireState();
}

class _OrderhireState extends State<Orderhire> {
  // Sample data with prices in Kenyan Shillings
  List<ShopItem> cartItems = [
    ShopItem(
      id: '1',
      name: 'Premium Headphones',
      price: 25999.85, // ~199.99 USD converted to KES
      imageUrl: 'assets/headphones.jpg',
      isLimited: false,
      availableQuantity: 10,
      estimatedDeliveryDays: 3,
    ),
    ShopItem(
      id: '2',
      name: 'Limited Edition Smartwatch',
      price: 38999.87, // ~299.99 USD converted to KES
      imageUrl: 'assets/smartwatch.jpg',
      isLimited: true,
      availableQuantity: 1,
      estimatedDeliveryDays: 5,
    ),
    ShopItem(
      id: '3',
      name: 'Wireless Earbuds',
      price: 11699.87, // ~89.99 USD converted to KES
      imageUrl: 'assets/earbuds.jpg',
      isLimited: false,
      availableQuantity: 15,
      estimatedDeliveryDays: 2,
    ),
  ];

  double get totalPrice {
    return cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));
  }

  void updateQuantity(ShopItem item, int newQuantity) {
    if (newQuantity > 0 && newQuantity <= item.availableQuantity) {
      setState(() {
        item.quantity = newQuantity;
      });
    }
  }

  void removeItem(ShopItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void checkout() {
    // Implement your checkout logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Checkout'),
        content: Text('Total: KSh ${totalPrice.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Process payment and navigate
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Order placed successfully!')),
              );
              // Clear cart after successful checkout
              setState(() {
                cartItems.clear();
              });
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  // Format price in Kenyan Shillings
  String formatPrice(double price) {
    // Using comma as thousand separator for better readability
    return 'KSh ${price.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        backgroundColor: Colors.grey,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your shopping bag is empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(Icons.image, size: 40),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Product details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      formatPrice(item.price),
                                      style: TextStyle(
                                        color: Colors.teal[700],
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Estimated delivery: ${item.estimatedDeliveryDays} day${item.estimatedDeliveryDays > 1 ? 's' : ''}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    if (item.isLimited)
                                      Text(
                                        'Limited item - Only ${item.availableQuantity} available',
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // Quantity control
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      if (!item.isLimited ||
                                          item.availableQuantity > 1)
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: item.quantity > 1
                                              ? () => updateQuantity(
                                                  item, item.quantity - 1)
                                              : null,
                                        ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      if (!item.isLimited ||
                                          item.availableQuantity > 1)
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: item.quantity <
                                                  item.availableQuantity
                                              ? () => updateQuantity(
                                                  item, item.quantity + 1)
                                              : null,
                                        ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    color: Colors.red[400],
                                    onPressed: () => removeItem(item),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Summary and checkout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatPrice(totalPrice),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: checkout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'CHECKOUT',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
