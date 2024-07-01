import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:bottle/routers/app_routes.dart';
import 'package:bottle/routers/app_routes_generate.dart';

final easyLoading = EasyLoading.init();
final fToast = FToastBuilder();

void main() {
  //需确保加载完成
  WidgetsFlutterBinding.ensureInitialized();

  const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  );

  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  GetStorage.init().then((bool e) {
    if (e) {
      runApp(const DriftBottleApp());
    }
  });
}

class DriftBottleApp extends StatelessWidget {
  const DriftBottleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '漂流瓶',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      builder: (BuildContext context, Widget? child) {
        child = easyLoading(context, child);
        child = fToast(context, child);
        // 点击空白,键盘消失
        child = Scaffold(
          body: GestureDetector(
            onTap: () => hideKeyboard(context),
            child: child,
          ),
        );

        return child;
      },
      initialRoute: AppRoutes.main,
      defaultTransition: Transition.cupertino,
      getPages: AppRoutesGenerate.onGenerateRoute(),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
