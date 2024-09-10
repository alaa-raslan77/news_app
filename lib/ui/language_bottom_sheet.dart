import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/app_colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
          color: AppColors.PrimaryGreen,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  context.setLocale(Locale('ar')).then((onValue) {
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("arabic".tr(),
                        style: GoogleFonts.poppins(
                            color: context.locale == Locale('ar')
                                ? Colors.white
                                : Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400)),
                    context.locale == Locale('ar')
                        ? Icon(Icons.done, color: Colors.white, size: 40)
                        : SizedBox(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  context.setLocale(Locale('en')).then((onValue) {
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("english".tr(),
                        style: GoogleFonts.poppins(
                            color: context.locale != Locale('ar')
                                ? Colors.white
                                : Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400)),
                    context.locale == Locale('en')
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 40,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
