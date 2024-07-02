class CartResponseModel {
  int? code;
  String? status;
  int? total;
  int? totalPages;
  int? page;
  int? limit;
  int? totalPrice;
  List<DataCartResponse>? data;

  CartResponseModel({
    this.code,
    this.status,
    this.total,
    this.totalPages,
    this.page,
    this.limit,
    this.totalPrice,
    this.data,
  });

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    total = json['total'];
    totalPages = json['total_pages'];
    page = json['page'];
    limit = json['limit'];
    totalPrice = json['totalPrice'];
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
    data['total'] = total;
    data['total_pages'] = totalPages;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPrice'] = totalPrice;
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
  int? quantity;
  int? unitPrice;
  int? total;
  String? createdAt;
  String? updatedAt;

  DataCartResponse(
      {this.id,
      this.userId,
      this.productId,
      this.quantity,
      this.unitPrice,
      this.total,
      this.createdAt,
      this.updatedAt});

  DataCartResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    total = json['total'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['productId'] = productId;
    data['quantity'] = quantity;
    data['unitPrice'] = unitPrice;
    data['total'] = total;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
