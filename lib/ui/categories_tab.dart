import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/category_item.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key, required this.onClick});
  var categories = CategoryModel.getCategories();
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40),
            child: Text(
              """pick your category 
of interest """
                  .tr(),
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F5A69)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(categories[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categories[index],
                    isOdd: index.isOdd,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
