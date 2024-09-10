import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/categories_tab.dart';
import 'package:news_app/ui/drawer.dart';
import 'package:news_app/ui/news_ui.dart';
import 'package:news_app/ui/search_delegate_tab.dart';
import 'package:news_app/ui/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
      child: Scaffold(
          drawer: DrawerUi(
            onClick: onDrawerClicked,
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(size: 40, color: Colors.white),
            title: Text(
              "newsApp".tr(),
              style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 27,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: SearchDelegateTab());
                    },
                    icon: Icon(
                      Icons.search,
                    )),
              ),
            ],
          ),
          body: selector == 2
              ? SettingsTab()
              : categoryModel == null
                  ? CategoriesTab(
                      onClick: onCategorySelected,
                    )
                  : NewsUi(
                      id: categoryModel!.id,
                    )),
    );
  }

  CategoryModel? categoryModel = null;
  int? selector;

  onDrawerClicked(id) {
    if (id == DrawerUi.CATEGORY_ID) {
      categoryModel = null;
      selector = 0;
      Navigator.pop(context);
    } else if (id == DrawerUi.SETTINGS_ID) {
      selector = 2;
      Navigator.pop(context);
    }
    setState(() {});
  }

  onCategorySelected(cat) {
    categoryModel = cat;
    setState(() {});
  }
}
