import 'package:fleetdesk_flutter/core/common/app_config.dart';
import 'package:fleetdesk_flutter/domain/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/app_strings.dart';
import '../../core/common/common_textfied.dart';

class AddData extends StatelessWidget {
  AddData({super.key});

  final HomePageController _homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.addTasks),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _homePageController.formKey,
          child: Column(
            children: [
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return AppString.pleaseEnterName;
                  }
                  return null;
                },
                controller: _homePageController.nameController,
                hintText: AppString.enterTaskName,
                keyBoardType: TextInputType.text,
                labelText: FirebaseKey.name,
                filled: true,
              ),
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return AppString.pleaseEnterDescription;
                  }
                  return null;
                },
                hintText: AppString.enterTaskDescription,
                keyBoardType: TextInputType.multiline,
                labelText: FirebaseKey.description,
                controller: _homePageController.descriptionController,
                filled: true,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size.fromHeight(70),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      _homePageController.onAddData();
                    },
                    child: const Text(AppString.save),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
