import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MainShadowLayerComponentComponent extends StatelessWidget {
  MainShadowLayerComponentComponent({super.key});

  final logic = Get.put(MainShadowLayerComponentLogic());
  final state = Get.find<MainShadowLayerComponentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(
        // () => Text("${state.visible.value}")
      () => state.visible.value ?
      //     ? AnimatedOpacity(
      //         opacity: state.animation.value.value,
      //         duration: state.animationController.value.duration!,
      //         child:
              Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(state.bottleLightAssetImage.value),
                    fit: BoxFit.fill,
                  ),
                ),
              // ),
            )
          : const SizedBox.shrink(),
    );
    return Obx(
      () => Visibility(
        visible: state.visible.value,
        child: AnimatedOpacity(
          opacity: state.animation.value.value,
          // 使用动画值作为透明度
          duration: state.animationController.value.duration!,
          // 设置动画持续时间（与AnimationController一致）
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(state.bottleLightAssetImage.value),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
