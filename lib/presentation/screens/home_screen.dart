import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';

// HomeScreen is the main screen of the app, displaying banners, categories, and popular food items.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0; // Current page for the bottom navigation bar

  // List of banner images
  final List<String> _banners = [
    'banner/banner1.png',
    'banner/banner2.png',
    'banner/banner3.png',
  ];

  // List of food categories
  final List<Map<String, String>> _categories = [
    {'image': 'CategoryItems/burger_category_logo.png', 'name': 'Burger'},
    {'image': 'CategoryItems/burito_category_logo.png', 'name': 'Burrito'},
    {'image': 'CategoryItems/donut_category_logo.png', 'name': 'Donut'},
    {'image': 'CategoryItems/drinks_category_logo.png', 'name': 'Drinks'},
    {'image': 'CategoryItems/dumpling_category_logo.png', 'name': 'Dumpling'},
    {'image': 'CategoryItems/fruits_category_logo.png', 'name': 'Fruits'},
    {'image': 'CategoryItems/ice_cream_category_logo.png', 'name': 'Ice Cream'},
    {'image': 'CategoryItems/noodles_category_logo.png', 'name': 'Noodles'},
    {'image': 'CategoryItems/pasta_category_logo.png', 'name': 'Pasta'},
    {'image': 'CategoryItems/pizza_category_logo.png', 'name': 'Pizza'},
    {'image': 'CategoryItems/rice_category_logo.png', 'name': 'Rice'},
    {'image': 'CategoryItems/more_category_logo.png', 'name': 'More'},
  ];

  // List of popular food items
  final List<Map<String, String>> _popularNow = [
    {
      'image': 'FootItems/burger_picture1.png',
      'name': 'Smoked Meat Burger ',
      'price': '12.99',
    },
    {'image': 'FootItems/pasta.png', 'name': 'Penne Pasta', 'price': '10.50'},
    {
      'image': 'FootItems/turkey_burger.png',
      'name': 'Turkey Burger',
      'price': '11.50',
    },
    {
      'image': 'FootItems/ramen_picture.png',
      'name': 'Ramen Noodles',
      'price': '9.75',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deliver to', style: TextStyle(fontSize: 12)),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(
                  'Sector 15, Noida',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food...',
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Special for you section
              const Text(
                'Special for you',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Banner carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: _banners.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/" + i),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Categories section
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Grid of categories
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/" + _categories[index]['image']!,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _categories[index]['name']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Popular Now section
              const Text(
                'Popular Now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Vertical list of popular food items
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _popularNow.map((item) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: AppColors.primaryColor,
                        child: SizedBox(
                          width: constraints.maxWidth > 200
                              ? (constraints.maxWidth / 2) - 15
                              : constraints.maxWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    child: Image.asset(
                                      "assets/${item['image']!}",
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${item['price']!}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: DotCurvedBottomNav(
          selectedIndex: _page,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          indicatorColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          items: const [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.shopping_cart),
            Icon(Icons.person),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }
}
