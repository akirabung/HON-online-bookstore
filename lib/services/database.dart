import 'package:app_book_store/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userProfile =
      Firestore.instance.collection('userData');

  Future createUserProfile(String firstName, String lastName) async {
    return await userProfile
        .document(uid)
        .setData({'firstName': firstName, 'lastName': lastName});
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        firstName: snapshot.data['firstName'],
        lastName: snapshot.data['lastName']);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userProfile.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
