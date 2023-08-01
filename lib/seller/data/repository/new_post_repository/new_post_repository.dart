import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../service/firebase_service/firebase_service.dart';

class NewPostRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<String> uploadPostImageToStorage(io.File? imageFile) async {
    try {
      Reference storageReference = _firebaseService.firebaseStorage.ref().child(
          '/images/post-images/${DateTime.now().millisecondsSinceEpoch}.png');
      UploadTask uploadTask = storageReference.putFile(imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<bool> savePostDetails(Map<String, dynamic> map) async {
    try {
      CollectionReference postsCollection =
          _firebaseService.firebaseFirestore.collection('posts/');

      await postsCollection.add(map);
      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error saving post details: $e");
      }
      return false;
    }
  }
}
