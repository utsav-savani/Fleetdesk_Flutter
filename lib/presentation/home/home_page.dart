import 'package:fleetdesk_flutter/core/common/app_enums.dart';
import 'package:fleetdesk_flutter/core/common/app_strings.dart';
import 'package:fleetdesk_flutter/domain/controllers/home_page_controller.dart';
import 'package:fleetdesk_flutter/domain/model.dart';
import 'package:fleetdesk_flutter/presentation/home/task_reports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_data.dart';
import 'edit_page.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(color: Colors.blueGrey),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () async{
          await Get.to(()=> AddData());
          _homePageController.getAllData();
        },
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => PieChartExample(),
              );
            },
            icon: const Icon(
              Icons.pie_chart,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => DropdownButton<String>(
                        elevation: 0,
                        value: _homePageController.selectedValue.value,
                        iconEnabledColor: Colors.black,
                        underline: const SizedBox(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        items:
                            _homePageController.taskStatus.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: value ==
                                        _homePageController.selectedValue.value
                                    ? const Color(0xff330066)
                                    : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          _homePageController.selectedValue.value = value!;
                          _homePageController.onChange();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Obx(
        () => _homePageController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _homePageController.showMainDataList.isNotEmpty
                ? ListView.builder(
                    primary: false,
                    itemCount: _homePageController.showMainDataList.length,
                    itemBuilder: (context, index) {
                      final AddTaskModel mainData =
                          _homePageController.showMainDataList[index];

                      return InkWell(
                        onTap: () async{
                          await Get.to(
                            () => EditPage(
                              user: mainData,
                            ),
                          );
                          await _homePageController.getAllData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _homePageController.colorsList[
                                          index %
                                              _homePageController
                                                  .colorsList.length],
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mainData.name ?? '',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            mainData.description ?? '',
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: mainData.status! ==
                                                  TaskStatus.pending
                                              ? Colors.yellow
                                              : Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        mainData.status!.name,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      AppString.dataNotFound,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
      ),
    );
  }
}
