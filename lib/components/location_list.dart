import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/country_list.dart';
import 'package:newsapp/controllers/news_controller.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);
  final NewsController _newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CountryList.countries.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _newsController.countryCode.value =
                    CountryList.countries[index]["code"]!;
                _newsController.posForLocation.value = index;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CountryList.countries[index]["country"]!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400),
                  ),
                  Obx(() => index == _newsController.posForLocation.value
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
