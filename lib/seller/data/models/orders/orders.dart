import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDataModel {
  final String? orderId;
  final String? sellerId;
  final String? postId;
  final DateTime? orderDate;
  final String? orderStatus;
  final String? itemName;
  final String? buyerId;
  final String? buyerName;
  final String? sellerName;
  final String? buyerDistrict;
  final String? sellerDistrict;
  final int? buyerMobile;
  final int? sellerMobile;
  final String? buyerEmailAddress;
  final String? sellerEmailAddress;
  final String? buyerMessage;
  final String? deliveryAddress;
  final int? itemQuantity;
  final double? totalAmount;
  final String? review;
  final double? rating;
  final double? itemPricePerUnit;
  final String? cancelledReason;
  final DateTime? cancelledDate;
  final double? deliveryFee;
  final String? deliveryMethod;
  final String? deliveryStatus;
  final int? riderMobile;
  final String? riderName;
  // final double? totalDistance;
  // final double? totalWeight;
  final String? vehicleNumber;

  OrderDataModel(
      {this.review,
      this.rating,
      this.itemPricePerUnit,
      this.deliveryFee,
      this.deliveryMethod,
      this.deliveryStatus,
      this.riderMobile,
      this.riderName,
      // this.totalDistance,
      // this.totalWeight,
      this.vehicleNumber,
      this.sellerName,
      this.sellerDistrict,
      this.sellerMobile,
      this.sellerEmailAddress,
      this.orderId,
      this.sellerId,
      this.postId,
      this.orderDate,
      this.orderStatus,
      this.itemName,
      this.buyerId,
      this.buyerName,
      this.buyerDistrict,
      this.buyerMobile,
      this.buyerEmailAddress,
      this.buyerMessage,
      this.deliveryAddress,
      this.itemQuantity,
      this.totalAmount,
      this.cancelledReason,
      this.cancelledDate});

  factory OrderDataModel.fromJson(String id, Map<String, dynamic> json) {
    return OrderDataModel(
      orderId: id,
      sellerId: json['sellerId'] as String?,
      postId: json['postId'] as String?,
      orderDate: (json['orderDate'] as Timestamp?)?.toDate(),
      orderStatus: json['orderStatus'] as String?,
      itemName: json['itemName'] as String?,
      buyerId: json['buyerId'] as String?,
      buyerName: json['buyerName'] as String?,
      sellerName: json['sellerName'] as String?,
      buyerDistrict: json['buyerDistrict'] as String?,
      sellerDistrict: json['sellerDistrict'] as String?,
      riderName: json['riderName'] as String?,
      buyerMobile: json['buyerMobile'] as int?,
      riderMobile: json['riderMobile'] as int?,
      sellerMobile: json['sellerMobile'] as int?,
      buyerEmailAddress: json['buyerEmailAddress'] as String?,
      sellerEmailAddress: json['sellerEmailAddress'] as String?,
      buyerMessage: json['buyerMessage'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      itemQuantity: json['itemQuantity'] as int,
      rating: json['rating'].toDouble(),
      itemPricePerUnit: json['itemPricePerUnit'].toDouble(),
      deliveryFee: json['deliveryFee'].toDouble(),
      // totalDistance: (json['totalDistance'] as int).toDouble(),
      // totalWeight: (json['totalWeight'] as int).toDouble(),
      totalAmount: json['totalAmount'].toDouble(),
      cancelledReason: json['cancelledReason'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      deliveryStatus: json['deliveryStatus'] as String?,
      review: json['review'] as String?,
      cancelledDate: (json['cancelledDate'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'sellerId': sellerId,
      'postId': postId,
      'orderDate': orderDate != null ? Timestamp.fromDate(orderDate!) : null,
      'orderStatus': orderStatus,
      'itemName': itemName,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'sellerName': sellerName,
      'buyerDistrict': buyerDistrict,
      'sellerDistrict': sellerDistrict,
      'buyerMobile': buyerMobile,
      'sellerMobile': sellerMobile,
      'buyerEmailAddress': buyerEmailAddress,
      'sellerEmailAddress': sellerEmailAddress,
      'buyerMessage': buyerMessage,
      'deliveryAddress': deliveryAddress,
      'itemQuantity': itemQuantity,
      'totalAmount': totalAmount,
      'cancelledReason': cancelledReason,
      'cancelledDate': cancelledDate,
      'deliveryFee': deliveryFee,
      'deliveryMethod': deliveryMethod,
      'deliveryStatus': deliveryStatus,
      'riderMobile': riderMobile,
      'riderName': riderName,
      // 'totalDistance': totalDistance,
      // 'totalWeight': totalWeight,
      'vehicleNumber': vehicleNumber,
      'itemPricePerUnit': itemPricePerUnit,
      'review': review,
      'rating': rating,
    };
  }
}
