import 'package:flutter/material.dart';
import 'package:food_court/controllers/home_controller.dart';
import 'package:food_court/screens/select_sub_modifiers.dart';
import 'package:get/get.dart';

import '../model/restaurant_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HomeController>(
      builder: (_) {
        var data = _.restaurantData!.data![0];
        return _.isLoading
            ? const SizedBox(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Name : ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              data.productName.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                            SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset(
                                    data.productImages!.images![0])),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: _.modifierGroup!.length,
                            itemBuilder: (context, index) {
                              return modifierList(_.modifierGroup![index], () {
                                _.addOnProducts = <CheckProduct>[].obs;
                                _.selectedSubModifier = <SubModifier>[].obs;
                                _.selectedModidifierName.value =
                                    _.modifierGroup![index].name.toString();
                                _.addValueInList(
                                    _.modifierGroup![index].subModifiers!);

                                Get.to(SelectModifier(
                                  modifierGroup: _.modifierGroup![index],
                                ));
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              );
      },
    ));
  }

  Widget modifierList(ModifierGroup modifierGroup, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(modifierGroup.name ?? 'no name'),
                const Icon(Icons.arrow_circle_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
