class Login {
  bool? status;
  String? message;
  Data? data;

  Login({this.status, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? roleId;
  String? mobileNumber;
  Null? gender;
  Null? address;
  Null? authToken;
  Null? verificationCode;
  Null? image;
  String? createdAt;
  String? updatedAt;
  Null? interest;
  Null? cmFirebaseToken;
  int? status;
  int? orderCount;
  Null? loginMedium;
  Null? socialId;
  Null? deletedAt;
  Null? latitude;
  Null? longitude;
  String? userRole;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.roleId,
        this.mobileNumber,
        this.gender,
        this.address,
        this.authToken,
        this.verificationCode,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.interest,
        this.cmFirebaseToken,
        this.status,
        this.orderCount,
        this.loginMedium,
        this.socialId,
        this.deletedAt,
        this.latitude,
        this.longitude,
        this.userRole});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    mobileNumber = json['mobile_number'];
    gender = json['gender'];
    address = json['address'];
    authToken = json['auth_token'];
    verificationCode = json['verification_code'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    interest = json['interest'];
    cmFirebaseToken = json['cm_firebase_token'];
    status = json['status'];
    orderCount = json['order_count'];
    loginMedium = json['login_medium'];
    socialId = json['social_id'];
    deletedAt = json['deleted_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['mobile_number'] = this.mobileNumber;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['auth_token'] = this.authToken;
    data['verification_code'] = this.verificationCode;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['interest'] = this.interest;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['status'] = this.status;
    data['order_count'] = this.orderCount;
    data['login_medium'] = this.loginMedium;
    data['social_id'] = this.socialId;
    data['deleted_at'] = this.deletedAt;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_role'] = this.userRole;
    return data;
  }
}