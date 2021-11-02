import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/controllers/news_controller.dart';

class Filter extends StatelessWidget {
  final String? title;

  final Widget? buildList;

  Filter({
    @required this.title,
    @required this.buildList,
  });
  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: const Divider(
              thickness: 1.0,
            ),
          ),
          Expanded(child: buildList!),
          Center(
            child: InkWell(
              onTap: () {
                _newsController.fetchTopHeadlines(
                    _newsController.category, _newsController.countryCode);
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.appBLUE,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: const Text(
                    "Apply",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
