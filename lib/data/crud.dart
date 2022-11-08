import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetdesk_flutter/core/common/app_config.dart';
import 'package:fleetdesk_flutter/domain/model.dart';

class Crud {
  static Future<List<AddTaskModel>> readAllData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(FirebaseKey.data).get();

    return snapshot.docs
        .map(
          (e) => AddTaskModel.fromSnapshot(e.data() as Map<String, dynamic>),
        )
        .toList();
  }

  static Future<void> createData(AddTaskModel user) async {
    final userCollection =
        FirebaseFirestore.instance.collection(FirebaseKey.data);
    final uid = userCollection.doc().id;
    final doc = userCollection.doc(uid);
    log(user.toMap().toString());
    final newUser = AddTaskModel(
      id: uid,
      name: user.name,
      description: user.description,
      status: user.status,
    ).toMap();
    try {
      await doc.set(newUser);
    } catch (e) {
      log("error:- $e");
    }
  }

  static Future<void> update(AddTaskModel user) async {
    final userCollection =
        FirebaseFirestore.instance.collection(FirebaseKey.data);
    final doc = userCollection.doc(user.id);
    final newUser = AddTaskModel(
      id: user.id,
      name: user.name,
      description: user.description,
      status: user.status,
    ).toMap();
    try {
      await doc.update(newUser);
    } catch (e) {
      log("error:- $e");
    }
  }

  static Future<void> delete(AddTaskModel user) async {
    final userCollection =
        FirebaseFirestore.instance.collection(FirebaseKey.data);
    await userCollection.doc(user.id).delete();
  }
}
