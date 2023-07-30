class OrderDataModel {
  final String orderId;
  final String orderName;
  final String customerName;
  final String orderDate;
  final String orderTime;
  final int orderStatus;
  final String orderDistrict;
  final double requesteingQuantity;
  final double totalWieght;
  final int customerMobile;
  final String customerEmailAddress;
  final String deliveryAddress;
  final String? customerMessage;
  final double itemAmount;
  final double? totalDistance;
  final double? deliveryFee;
  final double totalAmount;
  final double farmerReceived;
  final String? review;
  final double? rating;
  final double? cancelledReason;
  final String? cancelledDate;
  final String? deliveryStatus;
  final String? riderName;
  final int? riderContact;
  final String? deliveryMethod;
  final String? verhicleNumber;

  OrderDataModel(
      {required this.orderId,
      required this.orderName,
      required this.customerName,
      required this.orderDate,
      required this.orderTime,
      required this.orderStatus,
      required this.orderDistrict,
      required this.requesteingQuantity,
      required this.totalWieght,
      required this.customerMobile,
      required this.customerEmailAddress,
      required this.deliveryAddress,
      this.customerMessage,
      required this.itemAmount,
      this.totalDistance,
      this.deliveryFee,
      required this.totalAmount,
      required this.farmerReceived,
      this.review,
      this.rating,
      this.cancelledReason,
      this.cancelledDate,
      this.deliveryStatus,
      this.riderName,
      this.riderContact,
      this.deliveryMethod,
      this.verhicleNumber});
}
