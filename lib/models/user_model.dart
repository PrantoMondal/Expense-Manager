import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String mobile;
  final String image;
  final Timestamp userCreationTime;
  final String? deviceToken;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.mobile,
    required this.image,
    required this.userCreationTime,
    this.deviceToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      mobile: map['mobile'],
      image: map['image'],
      userCreationTime: map['userCreationTime'],
      deviceToken: map['deviceToken'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'mobile': mobile,
      'image': image,
      'userCreationTime': userCreationTime,
      'deviceToken': deviceToken,
    };
  }
}
