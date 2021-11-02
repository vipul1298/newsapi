import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/components/article_list.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/controllers/news_controller.dart';

class SearchNews extends StatefulWidget {
  SearchNews({Key? key}) : super(key: key);

  @override
  _SearchNewsState createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  final NewsController _newsController = Get.find();

  final TextEditingController _filter = new TextEditingController();
  String searchText = "";

  @override
  void initState() {
    _filter.addListener(() {
      _filter.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: AppColor.appGREY,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            searchText = value;
                          },
                          controller: _filter,
                          cursorHeight: 20,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for news,topics..."),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _newsController.query.value = searchText;
                          _newsController
                              .fetchResultsforQuery(_newsController.query);
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
              ),
            ),
            Obx(() {
              if (_newsController.isResultsForQueryLoading.value) {
                return Expanded(
                  child: const Center(
                    child: const CircularProgressIndicator(),
                  ),
                );
              } else if (_newsController.query.value == "") {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 100,
                      ),
                      const Text(
                        "No result found!",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              } else
                return Expanded(
                    child: ArticleList(
                        articleList: _newsController.articleListForQuery));
            })
          ],
        ),
      ),
    );
  }
}
