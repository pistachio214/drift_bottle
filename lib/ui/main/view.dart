import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final logic = Get.put(MainLogic());
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "漂流瓶 - 在线交友",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(state.backgroundAssetImage.value),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => SlideTransition(
                position: state.slideAnimation.value,
                child: Container(
                  width: Get.width,
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: UnconstrainedBox(
                    child: Container(
                      width: 35,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(state.balloonAssetImage.value),
                        fit: BoxFit.fitWidth,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              height: 95,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: state.deskHeight.value,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(state.deskAssetImage.value),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: Get.width * 0.80,
                      height: 85,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          deskItemWidget(state.sendAssetImage.value, 40, 90),
                          deskItemWidget(state.pickAssetImage.value, 60, 80),
                          deskItemWidget(state.myAssetImage.value, 50, 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget deskItemWidget(String assetImage, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
