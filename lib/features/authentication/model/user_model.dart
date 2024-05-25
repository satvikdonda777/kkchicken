class UserResponseModel {
  String? status;
  UserModel? userModel;

  UserResponseModel({this.status, this.userModel});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? userId;
  String? fname;
  String? email;
  String? mobile;
  String? token;

  UserModel({this.userId, this.fname, this.email, this.mobile, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fname = json['fname'];
    email = json['email'];
    mobile = json['mobile'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fname'] = fname;
    data['email'] = email;
    data['mobile'] = mobile;
    data['token'] = token;
    return data;
  }
}
