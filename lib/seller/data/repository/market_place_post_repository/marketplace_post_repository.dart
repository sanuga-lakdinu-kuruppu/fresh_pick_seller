import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_pick_seller/seller/data/service/firebase_service/firebase_service.dart';
import '../../models/post/post.dart';

class PostRepository {
  final FirebaseService _firebaseService = FirebaseService();
  Future<List<PostDataModel>> getAllPostItems(String sellerId) async {
    FirebaseFirestore firebaseFirestore = _firebaseService.firebaseFirestore;
    CollectionReference postsCollection = firebaseFirestore.collection('posts');

    QuerySnapshot querySnapshot =
        await postsCollection.where('sellerId', isEqualTo: sellerId).get();

    // Convert the query snapshot to a List of PostDataModel objects
    final posts = querySnapshot.docs
        .map((e) =>
            PostDataModel.fromJson(e.id, e.data() as Map<String, dynamic>))
        .toList();

    return posts;
    // } catch (e) {
    //   print(e.toString());
    //   return [];
    // }
  }
}
