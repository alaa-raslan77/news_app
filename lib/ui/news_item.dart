import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/ui/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              article.description ?? '',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              article.publishedAt!.substring(0, 10) ?? '',
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
