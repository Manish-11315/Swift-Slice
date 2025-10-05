# Basic Food Delivery App

A Flutter application for food delivery with a clean architecture and BLoC pattern for state management.

## Features

- **Authentication**: Sign up, sign in, and profile management
- **Food Browsing**: Browse food items by categories
- **Search**: Search for food items by name
- **Favorites**: Save and view favorite food items
- **Cart Management**: Add items to cart, modify quantities, and checkout
- **Order Tracking**: Place orders and track their status
- **User Profile**: View and edit user profile information

## Architecture

The application follows a clean architecture approach with the following layers:

### Domain Layer

- **Models**: Data models representing the core business entities
- **Repositories (Interfaces)**: Abstract definitions of data operations

### Data Layer

- **Repositories (Implementations)**: Concrete implementations of the repository interfaces
- **Mock Data**: Simulated backend data for development and testing

### Presentation Layer

- **BLoC**: Business Logic Components for managing state
- **Screens**: UI components for user interaction
- **Widgets**: Reusable UI components

## State Management

The application uses the BLoC (Business Logic Component) pattern for state management with the following components:

- **Events**: Represent user actions or system events
- **States**: Represent the current state of the application
- **BLoCs**: Handle events and emit new states

## Folder Structure

```
lib/
├── app/
│   └── view/
│       └── app.dart
├── data/
│   └── repositories/
│       ├── mock_cart_repository.dart
│       ├── mock_category_repository.dart
│       ├── mock_food_repository.dart
│       ├── mock_order_repository.dart
│       ├── mock_user_repository.dart
│       └── repositories.dart
├── domain/
│   ├── models/
│   │   ├── cart_item.dart
│   │   ├── category.dart
│   │   ├── food_item.dart
│   │   ├── models.dart
│   │   ├── order.dart
│   │   └── user.dart
│   └── repositories/
│       ├── cart_repository.dart
│       ├── category_repository.dart
│       ├── food_repository.dart
│       ├── order_repository.dart
│       ├── repositories.dart
│       └── user_repository.dart
├── presentation/
│   ├── auth/
│   │   ├── bloc/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── cart/
│   │   ├── bloc/
│   │   │   ├── cart_bloc.dart
│   │   │   ├── cart_event.dart
│   │   │   └── cart_state.dart
│   │   └── cart_screen.dart
│   ├── category/
│   │   └── bloc/
│   │       ├── category_bloc.dart
│   │       ├── category_event.dart
│   │       └── category_state.dart
│   ├── food/
│   │   ├── bloc/
│   │   │   ├── food_bloc.dart
│   │   │   ├── food_event.dart
│   │   │   └── food_state.dart
│   │   ├── favorites_screen.dart
│   │   ├── food_detail_screen.dart
│   │   └── search_results_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── order/
│   │   ├── bloc/
│   │   │   ├── order_bloc.dart
│   │   │   ├── order_event.dart
│   │   │   └── order_state.dart
│   │   ├── order_confirmation_screen.dart
│   │   ├── order_detail_screen.dart
│   │   └── orders_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── widgets/
│       ├── cart_item_card.dart
│       ├── category_card.dart
│       ├── food_card.dart
│       ├── order_card.dart
│       └── widgets.dart
└── main.dart
```

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Dependencies

- **flutter_bloc**: For state management
- **equatable**: For value equality
- **intl**: For date formatting

## Mock Data

The application uses mock data to simulate backend functionality. In a production environment, these would be replaced with actual API calls.

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
