import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl];

  static List<Category> dummyCategories = [
    const Category(
      id: 'cat1',
      name: 'Burgers',
      imageUrl: 'assets/Figma UI/category_burger.png',
    ),
    const Category(
      id: 'cat2',
      name: 'Pizzas',
      imageUrl: 'assets/Figma UI/category_pizza.png',
    ),
    const Category(
      id: 'cat3',
      name: 'Drinks',
      imageUrl: 'assets/Figma UI/category_drink.png',
    ),
    const Category(
      id: 'cat4',
      name: 'Desserts',
      imageUrl: 'assets/Figma UI/category_dessert.png',
    ),
  ];
}
