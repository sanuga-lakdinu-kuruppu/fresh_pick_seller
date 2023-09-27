import 'dart:io';

class NewPostDTO {
  String? sellerId;
  String? postName;
  DateTime? postedDate;
  String? postDescription;
  String? postCategory;
  String? postSubCategory;
  int? minimumOrderQty;
  String? unit;
  double? minimumOrderPrice;
  File? imageFile;
  String? district;
  String? province;
  String? pickupLocation;

  NewPostDTO(
      {this.district,
      this.province,
      this.sellerId,
      this.postName,
      this.postedDate,
      this.postDescription,
      this.postCategory,
      this.postSubCategory,
      this.minimumOrderQty,
      this.unit,
      this.minimumOrderPrice,
      this.imageFile,
      this.pickupLocation});
}
