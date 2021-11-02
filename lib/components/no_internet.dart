import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 70,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("No internet Connection!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
