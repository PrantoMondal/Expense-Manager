import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/models/user_model.dart';

class DbHelper {
  static const String collectionUser = 'users';
  static const String collectionIncome = 'income';
  static const String collectionExpense = 'expense';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<void> addUser(UserModel userModel) =>
      _db.collection(collectionUser).doc(userModel.uid).set(userModel.toMap());

  static Future<bool> doesUserExist(String uid) async {
    final snapshot = await _db.collection(collectionUser).doc(uid).get();
    return snapshot.exists;
  }

  Future<UserModel> getUserDetails(String uid) async {
    final snapshot =
        await _db.collection(collectionUser).where("uid", isEqualTo: uid).get();

    if (snapshot.docs.isNotEmpty) {
      final userData = UserModel.fromMap(snapshot.docs.first.data());
      return userData;
    } else {
      throw Exception('User not found');
    }
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(
          String uid) =>
      _db.collection(collectionUser).doc(uid).snapshots();

  static updateProfile(String uid, Map<String, dynamic> map) {}
}
