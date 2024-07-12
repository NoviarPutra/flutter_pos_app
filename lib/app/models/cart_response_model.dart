class CartResponseModel {
  int? code;
  String? status;
  String? message;
  List<DataCartResponse>? data;

  CartResponseModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCartResponse>[];
      json['data'].forEach((v) {
        data!.add(DataCartResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCartResponse {
  String? id;
  String? userId;
  String? productId;
  String? productName;
  String? productImage;
  int? productPrice;
  int? productQuantity;
  int? totalPrice;
  String? note;

  DataCartResponse({
    this.id,
    this.userId,
    this.productId,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productQuantity,
    this.totalPrice,
    this.note,
  });

  DataCartResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    productQuantity = json['productQuantity'];
    totalPrice = json['totalPrice'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['productId'] = productId;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['productPrice'] = productPrice;
    data['productQuantity'] = productQuantity;
    data['totalPrice'] = totalPrice;
    data['note'] = note;
    return data;
  }
}
