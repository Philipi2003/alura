import 'package:flutter/material.dart';

class NavItem {
  String name;
  String description;
  IconData icon;
  Widget route;

  NavItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.route
  });
}