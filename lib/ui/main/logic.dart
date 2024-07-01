import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import 'state.dart';

import 'package:device_info_plus/device_info_plus.dart';

class MainLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final MainState state = MainState();

  @override
  void onInit() {
    super.onInit();

    state.animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    ).obs;

    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    state.animationController.value.addStatusListener((status) {
      //AnimationStatus.completed 动画在结束时停止的状态
      if (status == AnimationStatus.completed) {
        //将动画重置到开始前的状态, 然后重新开始
        state.animationController.value.reset();

        // 等待5秒后再出来
        Future.delayed(const Duration(milliseconds: 30000), () {
          state.animationController.value.forward();
        });
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
        // state.animationController.value.forward();
      }
    });

    state.slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0.0), // 起始位置在右侧
      end: const Offset(-0.1, 0.0), // 结束位置在左侧
    ).animate(state.animationController.value).obs;

    state.animationController.value.forward();
  }

  void onClick() {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((AndroidDeviceInfo info) {
        Get.log(info.model);
        Get.log(info.version.toMap().toString());
        Get.log(info.data.toString());
      });
    }

    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((IosDeviceInfo info) {
        Get.log(info.name);
        Get.log(info.systemVersion);
        Get.log(info.identifierForVendor.toString());
      });
    }
  }

  @override
  void onClose() {
    super.onClose();

    // 关闭动画
    state.animationController.value.dispose();
  }
}
