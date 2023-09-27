class PostDataModel {
  late String? id;
  final String? sellerId;
  final String? postName;
  final DateTime? postedDate;
  final String? postDescription;
  final String? postCategory;
  final String? postSubCategory;
  final int? minimumOrderQty;
  final String? unit;
  final double? minimumOrderPrice;
  final String? postStatus;
  final int? countCompletedOrders;
  final String? imageUrl;
  final String? pickupLocation;

  PostDataModel(
      {required this.sellerId,
      required this.postName,
      required this.postCategory,
      required this.postSubCategory,
      required this.postDescription,
      required this.pickupLocation,
      required this.postedDate,
      required this.imageUrl,
      this.id,
      required this.minimumOrderQty,
      required this.unit,
      required this.minimumOrderPrice,
      required this.postStatus,
      required this.countCompletedOrders});

  factory PostDataModel.fromJson(String id, Map<String, dynamic> json) {
    return PostDataModel(
      id: id,
      sellerId: json['sellerId'],
      imageUrl: json['imageUrl'],
      postName: json['postName'],
      postCategory: json['postCategory'],
      postSubCategory: json['postSubCategory'],
      minimumOrderQty: json['minimumOrderQty'] as int,
      unit: json['unit'],
      minimumOrderPrice: json['minimumOrderPrice'],
      postStatus: json['postStatus'],
      postDescription: json['postDescription'],
      pickupLocation: json['pickupLocation'],
      countCompletedOrders: json['countCompletedOrders'],
      postedDate: json['postedDate'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'sellerId': sellerId,
      'postName': postName,
      'postCategory': postCategory,
      'postSubCategory': postSubCategory,
      'minimumOrderQty': minimumOrderQty,
      'unit': unit,
      'minimumOrderPrice': minimumOrderPrice,
      'postStatus': postStatus,
      'postDescription': postDescription,
      'pickupLocation': pickupLocation,
      'countCompletedOrders': countCompletedOrders,
      'postedDate': postedDate,
    };
  }
}
