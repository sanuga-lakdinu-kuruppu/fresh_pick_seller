class PostDataModel {
  final String id;
  final String productName;
  final String postedDate;
  final String postDescription;
  final String productCategory;
  final String productSubCategory;
  final double minimumOrderQty;
  final String unit;
  final double minimumOrderPrice;
  final int minimumOrderPricePer;
  final double productRating;
  final bool productStatus;
  final int countCompletedOrders;
  final String imageUrl;
  final String pickupLocation;

  PostDataModel(
      {required this.postDescription,
      required this.pickupLocation,
      required this.postedDate,
      required this.imageUrl,
      required this.id,
      required this.productName,
      required this.productCategory,
      required this.productSubCategory,
      required this.minimumOrderQty,
      required this.unit,
      required this.minimumOrderPrice,
      required this.minimumOrderPricePer,
      required this.productRating,
      required this.productStatus,
      required this.countCompletedOrders});
}
