import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/config/routes.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/cart_page.dart';
import 'package:kgk_diamonds_group_app/presentation/pages/result_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    const ResultPage(),
    const CartPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greyLight,
        title: ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, index, _) {
            return Text(
              index == 0 ? AppStrings.resultTitle : AppStrings.cartTitle,
              style:
                  Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textLight),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.filterPage);
            },
            icon: const Icon(Icons.sort, color: AppColors.textLight,),
          )
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.resultTitle),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: AppStrings.cartTitle),
            ],
          );
        },
      ),
    );
  }
}
