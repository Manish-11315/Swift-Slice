import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int calories;
  final bool isFavourite;
  final String category;

  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.calories,
    this.isFavourite = false,
    required this.category,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    double? rating,
    int? calories,
    bool? isFavourite,
    String? category,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      calories: calories ?? this.calories,
      isFavourite: isFavourite ?? this.isFavourite,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        rating,
        calories,
        isFavourite,
        category
  ];

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      calories: map['calories'],
      category: map['category'],
    );
  }

  static List<FoodItem> dummyItems = [
    FoodItem.fromMap({
      'id': '1',
      'name': 'Spicy Noodles',
      'description': 'Delicious spicy noodles with vegetables.',
      'price': 12.99,
      'imageUrl': 'assets/FootItems/noodles.png',
      'rating': 4.5,
      'calories': 350,
      'category': 'Noodles',
    }),
    FoodItem.fromMap({
      'id': '2',
      'name': 'Burger Combo',
      'description': 'Classic burger with fries and a drink.',
      'price': 15.50,
      'imageUrl': 'assets/FootItems/burger_picture1.png',
      'rating': 4.2,
      'calories': 700,
      'category': 'Burger',
    }),
    FoodItem.fromMap({
      'id': '3',
      'name': 'Salad Bowl',
      'description': 'Healthy and fresh salad bowl.',
      'price': 9.75,
      'imageUrl': 'assets/FootItems/fresh_fruits.png',
      'rating': 4.8,
      'calories': 250,
      'category': 'Salad',
    }),
  ];
}
