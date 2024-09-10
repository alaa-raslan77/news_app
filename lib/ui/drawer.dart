import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/app_colors.dart';

class DrawerUi extends StatelessWidget {
  Function onClick;
  DrawerUi({super.key, required this.onClick});
  static const int CATEGORY_ID = 1;
  static const int SETTINGS_ID = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 120,
            color: AppColors.PrimaryGreen,
            child: Text(
              "newsApp".tr(),
              style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 27,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              onClick(CATEGORY_ID);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.menu,
                  size: 50,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "categories".tr(),
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onClick(SETTINGS_ID);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "settings".tr(),
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
