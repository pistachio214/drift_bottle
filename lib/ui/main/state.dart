import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MainState {
  late RxDouble deskHeight = 40.0.obs;

  late RxBool lightBool = false.obs;

  late RxString balloonAssetImage = "assets/bottle/balloon.png".obs;

  late RxString backgroundAssetImage = "assets/bottle/background.jpg".obs;
  late RxString deskAssetImage = "assets/bottle/desk.jpg".obs;
  late RxString sendAssetImage = "assets/bottle/send.png".obs;
  late RxString pickAssetImage = "assets/bottle/pick.png".obs;
  late RxString myAssetImage = "assets/bottle/my.png".obs;

  late Rx<AnimationController> animationController;
  late Rx<Animation<Offset>> slideAnimation;

  MainState() {
    ///Initialize variables
  }
}
