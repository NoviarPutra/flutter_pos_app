class ProductsResponseModel {
  int? code;
  String? status;
  int? total;
  int? totalPages;
  int? page;
  int? limit;
  int? skip;
  List<DataProductResponse>? data;

  ProductsResponseModel({
    this.code,
    this.status,
    this.total,
    this.totalPages,
    this.page,
    this.limit,
    this.data,
  });

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    total = json['total'];
    totalPages = json['total_pages'];
    page = json['page'];
    limit = json['limit'];
    skip = json['skip'];
    if (json['data'] != null) {
      data = <DataProductResponse>[];
      json['data'].forEach((v) {
        data!.add(DataProductResponse.fromJson(v));
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
    data['skip'] = skip;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataProductResponse {
  String? id;
  String? name;
  String? categoryId;
  int? price;
  int? stock;
  String? image;
  String? description;
  bool? isActive;
  String? createdById;
  String? createdAt;
  String? updatedAt;
  Category? category;
  CreatedBy? createdBy;

  DataProductResponse({
    this.id,
    this.name,
    this.categoryId,
    this.price,
    this.stock,
    this.image,
    this.description,
    this.isActive,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.createdBy,
  });

  DataProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    price = json['price'];
    stock = json['stock'];
    image = json['image'];
    description = json['description'];
    isActive = json['isActive'];
    createdById = json['createdById'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['categoryId'] = categoryId;
    data['price'] = price;
    data['stock'] = stock;
    data['image'] = image;
    data['description'] = description;
    data['isActive'] = isActive;
    data['createdById'] = createdById;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class CreatedBy {
  String? id;
  String? name;
  String? role;

  CreatedBy({
    this.id,
    this.name,
    this.role,
  });

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    return data;
  }
}
