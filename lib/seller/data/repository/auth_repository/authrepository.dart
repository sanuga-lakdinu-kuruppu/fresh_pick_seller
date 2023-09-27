import 'package:firebase_auth/firebase_auth.dart';
import '../../service/firebase_service/firebase_service.dart';

class AuthRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseService.firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // Handle sign-in error
      print("Error signing in: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseService.firebaseAuth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return _firebaseService.firebaseAuth.currentUser;
  }
}
