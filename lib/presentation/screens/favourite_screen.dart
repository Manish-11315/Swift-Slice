import 'package:basic_food_delivery_app/data/models/food_item.dart';
import 'package:basic_food_delivery_app/logic/bloc/favourite/favourite_bloc.dart';
import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(LoadFavourites());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        backgroundColor: isDarkMode ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavouriteLoaded) {
            if (state.favouriteItems.isEmpty) {
              return const Center(child: Text('You have no favourite items yet.'));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: state.favouriteItems.length,
              itemBuilder: (context, index) {
                final foodItem = state.favouriteItems[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          foodItem.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodItem.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('\$${foodItem.price.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primaryColor)),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            context.read<FavouriteBloc>().add(RemoveFavourite(foodItem));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state is FavouriteError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }
}
