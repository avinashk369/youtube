import 'package:flutter/material.dart';
import 'package:youtube/screens/home.dart';
import 'package:youtube/screens/user_settings.dart';

class NavigationItems {
  final Widget page;
  final String title;
  final Icon icon;
  final Icon selectedIcon;

  NavigationItems({
    required this.page,
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });

  static List<NavigationItems> get items => [
        NavigationItems(
          page: const Home(),
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.grey,
          ),
          title: "Home",
          selectedIcon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        NavigationItems(
          page: const UserSettings(),
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.grey,
          ),
          title: "Settings",
          selectedIcon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ];
}
