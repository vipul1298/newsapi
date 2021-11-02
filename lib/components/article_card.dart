import 'package:flutter/material.dart';
import 'package:newsapp/constants/data.dart';

class ArticleCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? source;
  final String? publishedAt;

  ArticleCard(
      {@required this.imageUrl,
      @required this.title,
      @required this.source,
      @required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: Text(
                    source!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: _width * 0.6,
                  child: Text(
                    title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                  child: Text(
                    publishedAt!,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageUrl == null
                          ? const AssetImage(Data.PLACEHOLDER_IMAGE)
                              as ImageProvider
                          : NetworkImage(imageUrl!),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
