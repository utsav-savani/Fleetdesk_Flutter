import 'package:fleetdesk_flutter/core/common/app_enums.dart';
import 'package:fleetdesk_flutter/data/crud.dart';
import 'package:fleetdesk_flutter/domain/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<Color> colorsList = [
    Colors.grey,
    Colors.orange,
    Colors.deepPurple,
    Colors.greenAccent,
    Colors.red,
    Colors.pink,
    Colors.blueGrey,
    Colors.grey
  ];
  List<AddTaskModel> mainList = [];
  double pendingTaskCount = 0;
  double completedTaskCount = 0;
  final RxList<AddTaskModel> showMainDataList = <AddTaskModel>[].obs;
  final List<String> taskStatus = [
    'all',
    TaskStatus.pending.name,
    TaskStatus.completed.name,
  ];
  RxString selectedValue = 'all'.obs;
  RxBool isLoading = false.obs;
  final TextEditingController updateNameController = TextEditingController();
  final TextEditingController updateDescriptionController =
      TextEditingController();
  Rx<TaskStatus> selectedStatus = (TaskStatus.pending).obs;
  final List<TaskStatus> statusList = TaskStatus.values;
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  void getCount() {
    pendingTaskCount = 0;
    completedTaskCount = 0;
    mainList.forEach((element) {
      if ((element.status ?? TaskStatus.pending) == TaskStatus.pending) {
        pendingTaskCount++;
      } else if ((element.status ?? TaskStatus.pending) ==
          TaskStatus.completed) {
        completedTaskCount++;
      }
    });
  }

  void onChange() {
    showMainDataList.clear();
    if (selectedValue.value == TaskStatus.pending.name) {
      mainList.forEach((element) {
        if ((element.status ?? TaskStatus.pending) == TaskStatus.pending) {
          showMainDataList.add(element);
        }
      });
    } else if (selectedValue.value == TaskStatus.completed.name) {
      mainList.forEach((element) {
        if ((element.status ?? TaskStatus.pending) == TaskStatus.completed) {
          showMainDataList.add(element);
        }
      });
    } else {
      showMainDataList.addAll(mainList);
    }
  }

  Future<void> onAddData() async {
    if (formKey.currentState!.validate()) {
      FocusScope.of(Get.context!).unfocus();
      await Crud.createData(
        AddTaskModel(
          name: nameController.text.trim(),
          description: descriptionController.text.trim(),
          status: TaskStatus.pending,
        ),
      );
      Get.back();
    }
  }

  void onPushUpdate(AddTaskModel user) {
    if (formKey.currentState?.validate() ?? true) {
      Crud.update(
        AddTaskModel(
          id: user.id,
          name: updateNameController.text.trim(),
          description: updateDescriptionController.text.trim(),
          status: selectedStatus.value,
        ),
      ).then(
        (value) {
          Get.back();
        },
      );
    }
  }

  Future<void> getAllData() async {
    try {
      isLoading.value = true;
      mainList = await Crud.readAllData();
      getCount();
      showMainDataList.clear();
      showMainDataList.addAll(mainList);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }
}
