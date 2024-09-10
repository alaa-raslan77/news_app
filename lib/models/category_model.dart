import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/app_colors.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "sports",
          name: "sports",
          image: "assets/images/ball.png",
          color: AppColors.ColorRed),
      CategoryModel(
          id: "general",
          name: "general",
          image: "assets/images/Politics.png",
          color: AppColors.ColorDarkblue),
      CategoryModel(
          id: "health",
          name: "health",
          image: "assets/images/health.png",
          color: AppColors.Colorpink),
      CategoryModel(
          id: "business",
          name: "business",
          image: "assets/images/business.png",
          color: AppColors.ColorOrange),
      CategoryModel(
          id: "entertainment",
          name: "entertainment",
          image: "assets/images/environment.png",
          color: AppColors.ColorLightBlue),
      CategoryModel(
          id: "science",
          name: "science",
          image: "assets/images/science.png",
          color: AppColors.ColorYellow),
      CategoryModel(
          id: "technology",
          name: "technology",
          image: "assets/images/science.png",
          color: Colors.cyan),
    ];
  }
}
