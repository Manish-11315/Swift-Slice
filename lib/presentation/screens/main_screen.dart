import 'package:basic_food_delivery_app/presentation/screens/cart_view_screen.dart';
import 'package:basic_food_delivery_app/presentation/screens/favourite_screen.dart';
import 'package:basic_food_delivery_app/presentation/screens/home_screen.dart';
import 'package:basic_food_delivery_app/presentation/screens/profile_view_screen.dart';
import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';

import 'package:basic_food_delivery_app/logic/bloc/tab/tab_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const FavouriteScreen(),
      const CartViewScreen(),
      const ProfileViewScreen(),
    ];

    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.tabIndex,
            children: screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: DotCurvedBottomNav(
              selectedIndex: state.tabIndex,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,
              indicatorColor: AppColors.primaryColor,
              backgroundColor: AppColors.primaryColor,
              items: const [
                Icon(Icons.home),
                Icon(Icons.favorite),
                Icon(Icons.shopping_cart),
                Icon(Icons.person),
              ],
              onTap: (index) {
                context.read<TabBloc>().add(ChangeTab(index));
              },
            ),
          ),
        );
      },
    );
  }
}
