import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data_service/restaurant_data_service.dart';
import '../model/restaurant_model.dart';
import '../screens/checkout_screen.dart';
import '../widgets/common_snackbar.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  RxList<CheckProduct> addOnProducts = <CheckProduct>[].obs;
  RxList<SubModifier> selectedSubModifier = <SubModifier>[].obs;

  Restaurant? restaurantData;
  List<ModifierGroup>? modifierGroup;
  RxString selectedModidifierName = "".obs;
  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  @override
  void onReady() async {
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchData() async {
    restaurantData = Restaurant.fromJson(RestaurantService.data);
    modifierGroup = restaurantData!.data![0].modifierGroup;
  }

  addValueInList(List<SubModifier> subModifier) {
    for (var e in subModifier) {
      addOnProducts.add(CheckProduct(subModifier: e));
    }
  }

  checkValue(String value) {
    if (value == '1,1') {
      if (selectedSubModifier.length > 1 || selectedSubModifier.isEmpty) {
        CommonSnackbar.getSnackbar(
            "Message", "Please select one item", Colors.red);
      } else {
        Get.to(const CheckOutScreen());
      }
    } else if (value == '0,1') {
      if (selectedSubModifier.length > 1) {
        CommonSnackbar.getSnackbar(
            "Message", "More than one is not allowed", Colors.red);
      } else {
        Get.to(const CheckOutScreen());
      }
    } else if (value == '1,3') {
      if (selectedSubModifier.length > 3) {
        CommonSnackbar.getSnackbar(
            "Message", "Please select between 1 & 3", Colors.red);
      } else {
        Get.to(const CheckOutScreen());
      }
    } else {
      Get.to(const CheckOutScreen());
    }
  }
}

class CheckProduct {
  SubModifier subModifier;
  RxBool isChecked = false.obs;
  CheckProduct({
    required this.subModifier,
  });
}
