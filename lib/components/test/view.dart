import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestComponent extends StatelessWidget {
  TestComponent({Key? key}) : super(key: key);

  final logic = Get.put(TestLogic());
  final state = Get.find<TestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
