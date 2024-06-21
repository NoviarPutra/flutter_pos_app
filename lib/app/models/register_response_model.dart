class RegisterResponseModel {
  int? code;
  String? status;
  String? message;
  DataResgisterResponse? data;

  RegisterResponseModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? DataResgisterResponse.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataResgisterResponse {
  String? id;
  String? name;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  DataResgisterResponse({
    this.id,
    this.name,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  DataResgisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
