import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/common/filter.dart';
import 'package:newsapp/common/show_bottomsheet.dart';
import 'package:newsapp/components/location_list.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/controllers/network_controller.dart';
import 'package:newsapp/screens/home.dart';
import 'package:newsapp/components/no_internet.dart';

class AppEntry extends StatelessWidget {
  AppEntry({Key? key}) : super(key: key);
  final NetworkController _networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBACKGROUND,
      appBar: AppBar(
        title: const Text("MyNEWS"),
        actions: [
          Obx(() => _networkController.isInternetOn
              ? Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            showCustomBottomSheet(
                                widget: Filter(
                                    title: "Choose location",
                                    buildList: Location()));
                          },
                          icon: const Icon(
                            Icons.location_on,
                            size: 20,
                          )),
                    ],
                  ),
                )
              : Container())
        ],
      ),
      body: Obx(() => _networkController.isInternetOn ? Home() : NoInternet()),
    );
  }
}
