import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  bool isOdd;
  CategoryItem({required this.categoryModel, super.key, required this.isOdd});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 171,
        width: 148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: isOdd ? Radius.circular(25) : Radius.circular(0),
              bottomLeft: isOdd ? Radius.circular(0) : Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)),
          color: categoryModel.color,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset(
                  categoryModel.image,
                ),
              ),
              Text(
                "${categoryModel.name}".tr(),
                style: GoogleFonts.exo(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
