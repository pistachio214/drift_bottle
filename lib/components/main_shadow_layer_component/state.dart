import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainShadowLayerComponentState {
  late RxBool visible;

  late Rx<AnimationController> animationController;
  late Rx<Animation<double>> animation;

  late RxString bottleLightAssetImage = "assets/bottle/bottleLight.png".obs;

  MainShadowLayerComponentState() {
    visible = true.obs;
  }
}
