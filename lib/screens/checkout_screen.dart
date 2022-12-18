import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Selected Modifier : ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    homeController.selectedModidifierName.value,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Selected Sub-Modifiers',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      homeController.selectedSubModifier.length, (index) {
                    return Text(
                        " > ${homeController.selectedSubModifier[index].nameModifier}");
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
