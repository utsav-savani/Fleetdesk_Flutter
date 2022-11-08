import 'package:fleetdesk_flutter/core/common/app_config.dart';
import 'package:fleetdesk_flutter/core/common/app_enums.dart';

class AddTaskModel {
  String? name;
  String? description;
  TaskStatus? status;
  String? id;

  AddTaskModel({
    this.name,
    this.description,
    this.id,
    this.status,
  });

  AddTaskModel.fromSnapshot(Map<String, dynamic> snapshot) {
    name = snapshot[FirebaseKey.name];
    description = snapshot[FirebaseKey.description];
    id = snapshot[FirebaseKey.id];
    status = snapshot[FirebaseKey.status] == TaskStatus.pending.name
        ? TaskStatus.pending
        : TaskStatus.completed;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      FirebaseKey.name: name,
      FirebaseKey.description: description,
      FirebaseKey.id: id,
      FirebaseKey.status: status!.name,
    };
    return data;
  }
}
