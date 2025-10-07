import 'package:basic_food_delivery_app/logic/bloc/notification/notification_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/tab/tab_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/cart/cart_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/favourite/favourite_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/home/home_bloc.dart';
import 'package:basic_food_delivery_app/logic/bloc/profile/profile_bloc.dart';
import 'package:basic_food_delivery_app/presentation/screens/main_screen.dart';
import 'package:basic_food_delivery_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => TabBloc(),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc()..add(LoadFavourites()),
        ),
        BlocProvider(
          create: (context) => NotificationBloc()..add(LoadNotifications()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swift Slice',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const MainScreen(),
      ),
    );
  }
}
