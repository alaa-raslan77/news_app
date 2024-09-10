import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/app_colors.dart';
import 'package:news_app/ui/language_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "language".tr(),
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Center(
              child: Container(
                width: 319,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: AppColors.PrimaryGreen),
                        left: BorderSide(color: AppColors.PrimaryGreen),
                        right: BorderSide(color: AppColors.PrimaryGreen),
                        bottom: BorderSide(color: AppColors.PrimaryGreen))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      context.locale == Locale('ar')
                          ? "arabic".tr()
                          : "english".tr(),
                      style: GoogleFonts.poppins(
                          color: AppColors.PrimaryGreen,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.PrimaryGreen,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
