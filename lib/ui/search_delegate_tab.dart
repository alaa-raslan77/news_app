import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/app_colors.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/utils/API_MANGER.dart';

class SearchDelegateTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
            size: 30,
          )),
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BuildSearchWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          "No Sources",
          style: GoogleFonts.poppins(
            color: AppColors.PrimaryGreen,
            fontSize: 22,
          ),
        ),
      );
    }
    return BuildSearchWidget();
  }

  Widget BuildSearchWidget() {
    return FutureBuilder(
        future: apiManger.getSearch(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(
              "something went wrong",
              style: TextStyle(color: Colors.white),
            );
          }
          var search = snapshot.data?.articles ?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Color(0xff707070),
                      indent: 20,
                      endIndent: 20,
                    ),
                itemBuilder: (context, index) =>
                    NewsItem(article: search[index]),
                itemCount: search.length),
          );
        });
  }

  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        backgroundColor: AppColors.PrimaryGreen,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            side: BorderSide(color: Colors.white)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.poppins(
            fontSize: 23, color: Colors.white, fontWeight: FontWeight.w400),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 23),
      ),
    );
  }
}
