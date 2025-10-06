import 'package:basic_food_delivery_app/logic/bloc/notification/notification_bloc.dart';
import 'package:animations/animations.dart';
import 'package:basic_food_delivery_app/presentation/screens/notification/notification_screen.dart';
import 'package:basic_food_delivery_app/logic/bloc/tab/tab_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/favourite/favourite_bloc.dart';
import 'package:basic_food_delivery_app/data/models/food_item.dart';
import 'package:basic_food_delivery_app/logic/bloc/cart/cart_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/home/home_bloc.dart';
import 'package:basic_food_delivery_app/presentation/screens/search_screen.dart';
import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// HomeScreen is the main screen of the app, displaying banners, categories, and popular food items.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    context.read<HomeBloc>().add(LoadHomeData());
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<NotificationBloc>(context),
                    child: const NotificationScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OpenContainer(
                        closedElevation: 0,
                        openElevation: 0,
                        closedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        closedBuilder: (BuildContext _, VoidCallback openContainer) {
                          return AbsorbPointer(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for food...',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                            ),
                          );
                        },
                        openBuilder: (BuildContext _, VoidCallback __) {
                          return BlocProvider.value(
                            value: BlocProvider.of<HomeBloc>(context),
                            child: const SearchScreen(),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Special for you section
                    const Text(
                      'Special for you',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Banner carousel
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 150.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: state.banners.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Grid of categories
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.categories.length,
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
                                "assets/" + state.categories[index]['image']!,
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                state.categories[index]['name']!,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Vertical list of popular food items
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: state.popularNow.map((item) {
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
                                            item.imageUrl,
                                            height: 120,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: BlocBuilder<FavouriteBloc, FavouriteState>(
                                            builder: (context, state) {
                                              bool isFavourite = false;
                                              if (state is FavouriteLoaded) {
                                                isFavourite = state.favouriteItems.contains(item);
                                              }
                                              return Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (isFavourite) {
                                                      context.read<FavouriteBloc>().add(RemoveFavourite(item));
                                                    } else {
                                                      context.read<FavouriteBloc>().add(AddFavourite(item));
                                                    }
                                                  },
                                                  child: Icon(
                                                    isFavourite ? Icons.favorite : Icons.favorite_border,
                                                    color: isFavourite ? Colors.red : Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
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
                                                '\$${item.price.toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  context.read<CartBloc>().add(AddToCart(item));
                                                  context.read<TabBloc>().add(const ChangeTab(2));
                                                },
                                                icon: const Icon(
                                                  Icons.add_shopping_cart,
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
            );
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }
}