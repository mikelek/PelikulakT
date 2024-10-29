import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_outlined),
          label: 'Películas'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv_rounded),
          label: 'Series'
        )      ]
    );
  }
}