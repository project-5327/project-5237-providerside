import 'dart:convert';

class PropsalAcceptModel {
  int? status;
  String? message;
  ProposalData? data;

  PropsalAcceptModel({this.status, this.message, this.data});

  PropsalAcceptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProposalData.fromJson(json['data']) : null;
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

class ProposalData {
  Proposals? proposals;
  User? user;

  ProposalData({this.proposals, this.user});

  ProposalData.fromJson(Map<String, dynamic> json) {
    proposals = json['proposals'] != null
        ? new Proposals.fromJson(json['proposals'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.proposals != null) {
      data['proposals'] = this.proposals!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Proposals {
  String? sId;
  String? projectId;
  String? userId;
  String? proposalTitle;
  String? proposalDescription;
  int? estimatedTime;
  ProposedBudget? proposedBudget;
  String? status;
  String? address;
  List<String>? proposalImage;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Proposals(
      {this.sId,
        this.projectId,
        this.userId,
        this.proposalTitle,
        this.proposalDescription,
        this.estimatedTime,
        this.proposedBudget,
        this.status,
        this.address,
        this.proposalImage,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Proposals.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    projectId = json['projectId'];
    userId = json['userId'];
    proposalTitle = json['proposalTitle'];
    proposalDescription = json['proposalDescription'];
    estimatedTime = json['estimatedTime'];
    proposedBudget = json['proposedBudget'] != null
        ? new ProposedBudget.fromJson(json['proposedBudget'])
        : null;
    status = json['status'];
    address = json['address'];
    proposalImage = json['proposalImage'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['projectId'] = this.projectId;
    data['userId'] = this.userId;
    data['proposalTitle'] = this.proposalTitle;
    data['proposalDescription'] = this.proposalDescription;
    data['estimatedTime'] = this.estimatedTime;
    if (this.proposedBudget != null) {
      data['proposedBudget'] = this.proposedBudget!.toJson();
    }
    data['status'] = this.status;
    data['address'] = this.address;
    data['proposalImage'] = this.proposalImage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProposedBudget {
  String? numberDecimal;

  ProposedBudget({this.numberDecimal});

  ProposedBudget.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? email;
  String? password;
  bool? isClient;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? resetPasswordExpires;
  String? resetPasswordOTP;

  User(
      {this.sId,
        this.userName,
        this.email,
        this.password,
        this.isClient,
        this.isAdmin,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.resetPasswordExpires,
        this.resetPasswordOTP});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    isClient = json['isClient'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    resetPasswordExpires = json['resetPasswordExpires'];
    resetPasswordOTP = json['resetPasswordOTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isClient'] = this.isClient;
    data['isAdmin'] = this.isAdmin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['resetPasswordExpires'] = this.resetPasswordExpires;
    data['resetPasswordOTP'] = this.resetPasswordOTP;
    return data;
  }
}


PropsalAcceptModel acceptProposal(String str) {
  final jsonData = json.decode(str);
  return PropsalAcceptModel.fromJson(jsonData);
}
