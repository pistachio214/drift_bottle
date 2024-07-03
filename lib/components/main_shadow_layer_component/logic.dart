import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class MainShadowLayerComponentLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final MainShadowLayerComponentState state = MainShadowLayerComponentState();

  @override
  void onInit() {
    super.onInit();

    state.animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    ).obs;

    state.animationController.value.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        Get.log("completed");
      }
    });

    // 创建一个动画，从0.0（完全透明）到1.0（完全不透明）
    state.animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(state.animationController.value)
        .obs;

    // 执行动画,透明到实体的动画
    state.animationController.value.reset();
  }

  @override
  void onReady() {
    Get.log("阴影层: onReady");

    // state.animationController = AnimationController(
    //   duration: const Duration(milliseconds: 500),
    //   vsync: this,
    // ).obs;
    //
    // // 创建一个动画，从0.0（完全透明）到1.0（完全不透明）
    // state.animation = Tween<double>(begin: 0.0, end: 1.0)
    //     .animate(state.animationController.value)
    //     .obs;

    super.onReady();
  }

  void openModal() {
    state.visible.value = true;

    state.animationController.value.forward();

    // Future.delayed(const Duration(milliseconds: 3000), () {
    //
    // });
  }

  void closeModal() {
    Get.log("是不是根本没到？？？1111");
    state.visible.value = false;
  }
}
