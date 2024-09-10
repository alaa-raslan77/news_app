import 'package:flutter/material.dart';
import 'package:news_app/ui/app_colors.dart';
import 'package:news_app/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem({super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.PrimaryGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.PrimaryGreen, width: 2)),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : AppColors.PrimaryGreen,
            fontSize: 17),
      ),
    );
  }
}
