import 'dart:convert';

class PropsalAcceptModel {
  int? status;
  String? message;
  ProposalData? data;

  PropsalAcceptModel({this.status, this.message, this.data});

  PropsalAcceptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProposalData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
        ? Proposals.fromJson(json['proposals'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (proposals != null) {
      data['proposals'] = proposals!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
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
        ? ProposedBudget.fromJson(json['proposedBudget'])
        : null;
    status = json['status'];
    address = json['address'];
    proposalImage = json['proposalImage'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['projectId'] = projectId;
    data['userId'] = userId;
    data['proposalTitle'] = proposalTitle;
    data['proposalDescription'] = proposalDescription;
    data['estimatedTime'] = estimatedTime;
    if (proposedBudget != null) {
      data['proposedBudget'] = proposedBudget!.toJson();
    }
    data['status'] = status;
    data['address'] = address;
    data['proposalImage'] = proposalImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$numberDecimal'] = numberDecimal;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['isClient'] = isClient;
    data['isAdmin'] = isAdmin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['resetPasswordExpires'] = resetPasswordExpires;
    data['resetPasswordOTP'] = resetPasswordOTP;
    return data;
  }
}


PropsalAcceptModel acceptProposal(String str) {
  final jsonData = json.decode(str);
  return PropsalAcceptModel.fromJson(jsonData);
}
