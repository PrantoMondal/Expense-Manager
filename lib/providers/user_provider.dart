import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/db/db_helper.dart';
import 'package:expense_manager/models/income_model.dart';
import 'package:expense_manager/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  Future<void> adduser(UserModel userModel) => DbHelper.addUser(userModel);
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) =>
      DbHelper.getUserByUid(uid);

  Future<bool> doesUserExist(String uid) => DbHelper.doesUserExist(uid);

  Future<void> updateProfile(String uid, Map<String, dynamic> map) =>
      DbHelper.updateProfile(uid, map);

  Future<String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final photoRef =
        FirebaseStorage.instance.ref().child('Pictures/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }

  Future<Map<String, dynamic>?> getUserByDocId(String docId) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(docId).get();

      if (snapshot.exists) {
        Map<String, dynamic>? userData =
            snapshot.data() as Map<String, dynamic>?;
        return userData;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  //add income
  Future<void> addIncome(IncomeModel incomeModel) =>
      DbHelper.addIncome(incomeModel);
}
