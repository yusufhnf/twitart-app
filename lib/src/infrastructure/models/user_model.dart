import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? displayImage;

  UserModel({this.id, this.name, this.email, this.displayImage});

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
        id: documentSnapshot.id,
        name: documentSnapshot["name"],
        email: documentSnapshot["email"],
        displayImage: documentSnapshot["displayImage"]);
  }
}
