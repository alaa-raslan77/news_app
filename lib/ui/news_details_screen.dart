import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "detailsScreen";
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(size: 40, color: Colors.white),
            title: Text(
              "News App",
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    )),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey.shade300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      article.urlToImage ?? '',
                      height: 240,
                    )),
                Text(
                  article.source?.name ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
                Text(
                  article.title ?? '',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text(
                  article.publishedAt!.substring(0, 10) ?? '',
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  article.description ?? '',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  article.content ?? '',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrl(article.url ?? "");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View Full Article",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
