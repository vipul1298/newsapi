import 'package:flutter/material.dart';
import 'package:newsapp/common/launch_url.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/constants/data.dart';

class Article extends StatelessWidget {
  final String? imageUrl;
  final String? description;
  final String? publishedAt;
  final String? source;
  final String? url;
  final String? title;
  Article(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.source,
      @required this.publishedAt,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: _height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageUrl == null
                                ? const AssetImage(Data.PLACEHOLDER_IMAGE)
                                    as ImageProvider
                                : NetworkImage(imageUrl!),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      bottom: 8,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          width: _width * 0.8,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            title ?? "Nothing to show",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  source!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  publishedAt!,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColor.appGREY),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description!,
                  maxLines: 10,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => launchURL(context, url!),
                    child: const Text("See full story >")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
