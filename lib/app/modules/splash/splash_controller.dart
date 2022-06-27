import 'package:flappybird/app/data/utils/screen_info.dart';
import 'package:flappybird/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    ScreenInfo.init();
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Routes.GAME);
  }
}
