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
      name: 'Burger',
      imageUrl: 'assets/CategoryItems/burger_category_logo.png',
    ),
    const Category(
      id: 'cat2',
      name: 'Taco',
      imageUrl: 'assets/CategoryItems/taco_category_logo.png',
    ),
    const Category(
      id: 'cat3',
      name: 'Burrito',
      imageUrl: 'assets/CategoryItems/burito_category_logo.png',
    ),
    const Category(
      id: 'cat4',
      name: 'Drink',
      imageUrl: 'assets/CategoryItems/drinks_category_logo.png',
    ),
    const Category(
      id: 'cat5',
      name: 'Pizza',
      imageUrl: 'assets/CategoryItems/pizza_category_logo.png',
    ),
    const Category(
      id: 'cat6',
      name: 'Donut',
      imageUrl: 'assets/CategoryItems/donut_category_logo.png',
    ),
    const Category(
      id: 'cat7',
      name: 'Salad',
      imageUrl: 'assets/CategoryItems/salad_category_logo.png',
    ),
    const Category(
      id: 'cat8',
      name: 'Noodles',
      imageUrl: 'assets/CategoryItems/noodles_category_logo.png',
    ),
    const Category(
      id: 'cat9',
      name: 'Sandwich',
      imageUrl: 'assets/CategoryItems/sandwich_category_logo.png',
    ),
    const Category(
      id: 'cat10',
      name: 'Pasta',
      imageUrl: 'assets/CategoryItems/pasta_category_logo.png',
    ),
    const Category(
      id: 'cat11',
      name: 'Ice Cream',
      imageUrl: 'assets/CategoryItems/ice_cream_category_logo.png',
    ),
    const Category(
      id: 'cat12',
      name: 'Rice',
      imageUrl: 'assets/CategoryItems/rice_category_logo.png',
    ),
    const Category(
      id: 'cat13',
      name: 'Takoyaki',
      imageUrl: 'assets/CategoryItems/takoyaki_category_logo.png',
    ),
    const Category(
      id: 'cat14',
      name: 'Fruit',
      imageUrl: 'assets/CategoryItems/fruits_category_logo.png',
    ),
    const Category(
      id: 'cat15',
      name: 'Sausage',
      imageUrl: 'assets/CategoryItems/sausage_category_logo.png',
    ),
    const Category(
      id: 'cat20',
      name: 'Dumpling',
      imageUrl: 'assets/CategoryItems/dumpling_category_logo.png',
    ),
  ];
}
