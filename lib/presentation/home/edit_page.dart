import 'package:fleetdesk_flutter/core/common/app_enums.dart';
import 'package:fleetdesk_flutter/core/common/common_textfied.dart';
import 'package:fleetdesk_flutter/data/crud.dart';
import 'package:fleetdesk_flutter/domain/controllers/home_page_controller.dart';
import 'package:fleetdesk_flutter/domain/model.dart';
import 'package:fleetdesk_flutter/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/app_strings.dart';

class EditPage extends StatelessWidget {
  final AddTaskModel user;

  EditPage({
    Key? key,
    required this.user,
  }) : super(key: key) {
    _homePageController.updateNameController.text = user.name ?? "";
    _homePageController.updateDescriptionController.text =
        user.description ?? "";
    _homePageController.selectedStatus.value =
        user.status ?? TaskStatus.pending;
  }

  final HomePageController _homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.updateTaskDetails),
        actions: [
          IconButton(
            onPressed: () {
              Crud.delete(user).then(
                (value) {
                  Get.back();
                },
              );
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _homePageController.updateFormKey,
          child: Column(
            children: [
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return AppString.pleaseEnterName;
                  }
                  return null;
                },
                controller: _homePageController.updateNameController,
              ),
              TextFieldWidget(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return AppString.pleaseEnterDescription;
                  }
                  return null;
                },
                controller: _homePageController.updateDescriptionController,
              ),
              Obx(
                () => DropdownButton<TaskStatus>(
                  value: _homePageController.selectedStatus.value,
                  items: _homePageController.statusList.map((TaskStatus value) {
                    return DropdownMenuItem<TaskStatus>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (TaskStatus? value) {
                    _homePageController.selectedStatus.value = value!;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _homePageController.onPushUpdate(user);
                },
                child: const Text(AppString.update),
              )
            ],
          ),
        ),
      ),
    );
  }
}
