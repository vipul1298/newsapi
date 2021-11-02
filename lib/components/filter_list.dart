import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/category.dart';
import 'package:newsapp/controllers/news_controller.dart';

class FilterList extends StatelessWidget {
  FilterList({Key? key}) : super(key: key);
  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Category.categorylist.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _newsController.category.value =
                    Category.categorylist[index]["category"]!;
                _newsController.posForCategory.value = index;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Category.categorylist[index]["name"]!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400),
                  ),
                  Obx(() => index == _newsController.posForCategory.value
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Container())
                ],
              ),
            ),
          );
        });
  }
}
