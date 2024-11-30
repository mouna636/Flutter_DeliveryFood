import 'package:flutter/material.dart';
import 'package:food_delivery/pages/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delivery Food Application",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              // Title
              const Text(
                "Delicious food",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Discover and get great food",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20.0),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryItem(
                    isSelected: icecream,
                    imagePath: "images/ice-cream.png",
                    onTap: () {
                      setState(() {
                        icecream = true;
                        pizza = false;
                        salad = false;
                        burger = false;
                      });
                    },
                  ),
                  buildCategoryItem(
                    isSelected: burger,
                    imagePath: "images/burger.png",
                    onTap: () {
                      setState(() {
                        icecream = false;
                        pizza = false;
                        salad = false;
                        burger = true;
                      });
                    },
                  ),
                  buildCategoryItem(
                    isSelected: salad,
                    imagePath: "images/salad.png",
                    onTap: () {
                      setState(() {
                        icecream = false;
                        pizza = false;
                        salad = true;
                        burger = false;
                      });
                    },
                  ),
                  buildCategoryItem(
                    isSelected: pizza,
                    imagePath: "images/pizza.png",
                    onTap: () {
                      setState(() {
                        icecream = false;
                        pizza = true;
                        salad = false;
                        burger = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30.0),

              // Product list
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              image: "images/salad2.png",
                              name: "Salade verte",
                              price: "25",
                              detail: "Fresh and healthy",
                            ),
                          ),
                        );
                      },
                      child: buildProductItem(
                        imagePath: "images/salad2.png",
                        title: "Salade verte",
                        description: "Fresh and healthy",
                        price: "\$25",
                      ),
                    ),
                    buildProductItem(
                      imagePath: "images/salad3.png",
                      title: "Mix veg",
                      description: "Spicy with onion",
                      price: "\$28",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              // Highlighted item
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/salad3.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mediterranean Chickpea Salad",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            const Text(
                              "Honey cheese",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            const Text(
                              "\$28",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category widget
  Widget buildCategoryItem({
    required bool isSelected,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
            color: isSelected ? Colors.white : null,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Product widget
  Widget buildProductItem({
    required String imagePath,
    required String title,
    required String description,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, height: 150, width: 150, fit: BoxFit.cover),
              const SizedBox(height: 5.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
