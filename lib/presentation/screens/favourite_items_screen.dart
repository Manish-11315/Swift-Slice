import 'package:basic_food_delivery_app/data/models/food_item.dart';
import 'package:basic_food_delivery_app/logic/bloc/favourite/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteItemsScreen extends StatelessWidget {
  const FavouriteItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavouriteLoaded) {
            if (state.favouriteItems.isEmpty) {
              return const Center(child: Text('No favourite items yet.'));
            }
            return ListView.builder(
              itemCount: state.favouriteItems.length,
              itemBuilder: (context, index) {
                final item = state.favouriteItems[index];
                return ListTile(
                  leading: Image.asset(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      context.read<FavouriteBloc>().add(RemoveFavourite(item));
                    },
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