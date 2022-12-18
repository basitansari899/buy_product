import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../model/restaurant_model.dart';

class SelectModifier extends StatelessWidget {
  final ModifierGroup modifierGroup;
  const SelectModifier({super.key, required this.modifierGroup});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Sub-Modifiers'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(homeController.addOnProducts.length, (index) {
            return Obx(
              () => CheckboxListTile(
                title: Text(homeController
                    .addOnProducts[index].subModifier.nameModifier
                    .toString()),
                value: homeController.addOnProducts[index].isChecked.value,
                onChanged: (val) {
                  homeController.addOnProducts[index].isChecked.value = val!;
                  if (homeController.addOnProducts[index].isChecked.value) {
                    homeController.selectedSubModifier
                        .add(homeController.addOnProducts[index].subModifier);
                  } else {
                    homeController.selectedSubModifier.remove(
                        homeController.addOnProducts[index].subModifier);
                  }
                },
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 17, 13, 224), //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: const Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              homeController
                  .checkValue(modifierGroup.limitModifiers!.toString());
            },
            child: const Text(
              'Check Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
