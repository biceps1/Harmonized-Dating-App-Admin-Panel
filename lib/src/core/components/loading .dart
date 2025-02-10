import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoadingWidget extends StatelessWidget {
  LoadingWidget({super.key});
  final loading = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          width:
              loading.isLoading.value ? MediaQuery.of(context).size.width : 0,
          height:
              loading.isLoading.value ? MediaQuery.of(context).size.height : 0,
          color: Colors.black54.withOpacity(0.5),
          child: const Center(
            child: SizedBox(
              width: 32,
              height: 32,
              // child:  Lottie.asset('images/loading.json'),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}


final loading = Get.find<LoadingController>().isLoading;

class LoadingController extends GetxController {
  final Rx<bool> isLoading = false.obs;
  @override
  void onInit() {
    isLoading(false);
    super.onInit();
  }
}