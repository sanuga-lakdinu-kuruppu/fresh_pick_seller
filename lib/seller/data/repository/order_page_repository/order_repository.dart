import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/orders/orders.dart';
import '../../service/firebase_service/firebase_service.dart';

class OrderRepository {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<OrderDataModel>> getAllOders(
      String sellerId, String orderStatus) async {
    FirebaseFirestore firebaseFirestore = _firebaseService.firebaseFirestore;
    CollectionReference ordersCollection =
        firebaseFirestore.collection('orders');

    QuerySnapshot querySnapshot = await ordersCollection
        .where('sellerId', isEqualTo: sellerId)
        .where('orderStatus', isEqualTo: orderStatus)
        .get();

    final orders = querySnapshot.docs
        .map((e) =>
            OrderDataModel.fromJson(e.id, e.data() as Map<String, dynamic>))
        .toList();

    return orders;
  }

  Future<bool> updateOrderStatus(String status, String orderId) async {
    FirebaseFirestore firebaseFirestore = _firebaseService.firebaseFirestore;
    CollectionReference ordersCollection =
        firebaseFirestore.collection('orders');

    try {
      DocumentReference orderRef = ordersCollection.doc(orderId);

      await orderRef.update({'orderStatus': status});

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateDeliveryStatus(String status, String orderId) async {
    FirebaseFirestore firebaseFirestore = _firebaseService.firebaseFirestore;
    CollectionReference ordersCollection =
        firebaseFirestore.collection('orders');

    try {
      DocumentReference orderRef = ordersCollection.doc(orderId);

      await orderRef.update({'deliveryStatus': status});

      return true;
    } catch (e) {
      return false;
    }
  }
}
