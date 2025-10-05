import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int calories;

  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.calories,
  });

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, rating, calories];

  static List<FoodItem> dummyItems = [
    const FoodItem(
      id: '1',
      name: 'Spicy Noodles',
      description: 'Delicious spicy noodles with vegetables.',
      price: 12.99,
      imageUrl: 'assets/Figma UI/food_item_1.png',
      rating: 4.5,
      calories: 350,
    ),
    const FoodItem(
      id: '2',
      name: 'Burger Combo',
      description: 'Classic burger with fries and a drink.',
      price: 15.50,
      imageUrl: 'assets/Figma UI/food_item_2.png',
      rating: 4.2,
      calories: 700,
    ),
    const FoodItem(
      id: '3',
      name: 'Salad Bowl',
      description: 'Healthy and fresh salad bowl.',
      price: 9.75,
      imageUrl: 'assets/Figma UI/food_item_3.png',
      rating: 4.8,
      calories: 250,
    ),
  ];
}
