import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/common/filter.dart';
import 'package:newsapp/common/show_bottomsheet.dart';
import 'package:newsapp/components/article_list.dart';
import 'package:newsapp/components/filter_list.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/controllers/news_controller.dart';
import 'package:newsapp/screens/search_news.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => SearchNews());
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: AppColor.appGREY,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: const Text("Search news,topics...")),
                      ),
                      const Icon(Icons.search)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Headlines",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: Obx(() {
                  if (_newsController.isLoading.value)
                    return const Center(
                      child: const CircularProgressIndicator(),
                    );
                  else
                    return ArticleList(articleList: _newsController.newsList);
                }),
              ),
            ))
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton(
            backgroundColor: AppColor.appBLUE,
            onPressed: () {
              print("Working");
              showCustomBottomSheet(
                  widget: Filter(
                      title: "Filter by category", buildList: FilterList()));
            },
            child: const Icon(Icons.filter_alt_outlined),
          ),
        )
      ],
    );
  }
}
