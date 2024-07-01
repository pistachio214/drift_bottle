import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class OnBoardPage extends StatelessWidget {
  OnBoardPage({super.key});

  final logic = Get.put(OnBoardLogic());
  final state = Get.find<OnBoardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("引导页"),
      ),
    );
  }
}
