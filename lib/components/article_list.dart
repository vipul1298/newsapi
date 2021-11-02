import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/common/dateformat.dart';
import 'package:newsapp/components/article_card.dart';
import 'package:newsapp/screens/article.dart';

class ArticleList extends StatelessWidget {
  final List? articleList;
  const ArticleList({@required this.articleList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: articleList!.length,
        itemBuilder: (ctx, index) {
          var articles = articleList!;

          return InkWell(
            onTap: () => Get.to(() => Article(
                title: articles[index].title ?? "No Title available",
                imageUrl: articles[index].urlToImage,
                description:
                    articles[index].description ?? "No Description available",
                source: articles[index].source.name,
                publishedAt: dateConverter(articles[index].publishedAt),
                url: articles[index].url)),
            child: ArticleCard(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title ?? "No Title",
                source: articles[index].source.name,
                publishedAt: timeAgoSinceDate(articles[index].publishedAt)),
          );
        });
  }
}
