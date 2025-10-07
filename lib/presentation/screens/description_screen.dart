import 'package:basic_food_delivery_app/data/models/food_item.dart';
import 'package:basic_food_delivery_app/logic/bloc/cart/cart_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/favourite/favourite_bloc.dart';
import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionScreen extends StatefulWidget {
  final FoodItem foodItem;

  const DescriptionScreen({Key? key, required this.foodItem}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int quantity = 1;
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    final cartState = context.read<CartBloc>().state;
    if (cartState is CartLoaded) {
      final cartItems = cartState.cartItems.where((item) => item.foodItem.id == widget.foodItem.id);
      if (cartItems.isNotEmpty) {
        setState(() {
          quantity = cartItems.first.quantity;
          isAdded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        widget.foodItem.imageUrl,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 40,
                        left: 16,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 16,
                        child: BlocBuilder<FavouriteBloc, FavouriteState>(
                          builder: (context, state) {
                            bool isFavourite = false;
                            if (state is FavouriteLoaded) {
                              isFavourite = state.favouriteItems.contains(widget.foodItem);
                            }
                            return IconButton(
                              icon: Icon(
                                isFavourite ? Icons.favorite : Icons.favorite_border,
                                color: isFavourite ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                if (isFavourite) {
                                  context.read<FavouriteBloc>().add(RemoveFavourite(widget.foodItem));
                                } else {
                                  context.read<FavouriteBloc>().add(AddFavourite(widget.foodItem));
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.foodItem.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '\$${(widget.foodItem.price * 1.2).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '\$${widget.foodItem.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.foodItem.rating} (1.205)',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See all review',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.foodItem.description,
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See more',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Additional Options :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Add Cheese'),
                          value: false,
                          onChanged: (value) {},
                          secondary: const Text('+ \$0.50'),
                        ),
                        CheckboxListTile(
                          title: const Text('Add Bacon'),
                          value: false,
                          onChanged: (value) {},
                          secondary: const Text('+ \$1.00'),
                        ),
                        CheckboxListTile(
                          title: const Text('Add Meat'),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: (Theme.of(context).brightness == Brightness.dark)
                        ? AppColors.darkContaineraColor.withOpacity(0.5)
                        : AppColors.lightContainerColor.withOpacity(0.5),
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                            isAdded = false;
                          });
                        }
                      },
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                          isAdded = false;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: isAdded
                      ? null
                      : () {
                          final cartState = context.read<CartBloc>().state;
                          if (cartState is CartLoaded) {
                            final cartItems = cartState.cartItems.where((item) => item.foodItem.id == widget.foodItem.id);
                            if (cartItems.isNotEmpty) {
                              context.read<CartBloc>().add(UpdateCartItem(widget.foodItem, quantity));
                            } else {
                              context.read<CartBloc>().add(AddToCart(widget.foodItem));
                            }
                            setState(() {
                              isAdded = true;
                            });
                          }
                        },
                  icon: const Icon(Icons.shopping_basket),
                  label: Text(isAdded ? 'Added to Basket' : 'Add to Basket'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
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
