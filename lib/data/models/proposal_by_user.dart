class ProposalByUser {
  int? status;
  String? message;
  List<Data>? data;

  ProposalByUser({this.status, this.message, this.data});

  ProposalByUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  ProjectId? projectId;
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
  FreelancerDetails? freelancerDetails;
  FreelancerDetails? clientDetails;

  Data(
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
      this.iV,
      this.freelancerDetails,
      this.clientDetails});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    projectId = json['projectId'] != null
        ? ProjectId.fromJson(json['projectId'])
        : null;
    userId = json['userId'];
    proposalTitle = json['proposalTitle'];
    proposalDescription = json['proposalDescription'];
    estimatedTime = json['estimatedTime'];
    proposedBudget = json['proposedBudget'] != null
        ? ProposedBudget.fromJson(json['proposedBudget'])
        : null;
    status = json['status'];
    address = json['address'];
    proposalImage = json['proposalImage']?.cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    freelancerDetails = json['freelancerDetails'] != null
        ? FreelancerDetails.fromJson(json['freelancerDetails'])
        : null;
    clientDetails = json['clientDetails'] != null
        ? FreelancerDetails.fromJson(json['clientDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    if (this.projectId != null) {
      data['projectId'] = this.projectId?.toJson();
    }
    data['userId'] = this.userId;
    data['proposalTitle'] = this.proposalTitle;
    data['proposalDescription'] = this.proposalDescription;
    data['estimatedTime'] = this.estimatedTime;
    if (this.proposedBudget != null) {
      data['proposedBudget'] = this.proposedBudget?.toJson();
    }
    data['status'] = this.status;
    data['address'] = this.address;
    data['proposalImage'] = this.proposalImage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.freelancerDetails != null) {
      data['freelancerDetails'] = this.freelancerDetails?.toJson();
    }
    if (this.clientDetails != null) {
      data['clientDetails'] = this.clientDetails?.toJson();
    }
    return data;
  }
}

class ProjectId {
  String? sId;
  ClientId? clientId;
  String? title;
  String? description;

  ProjectId({this.sId, this.clientId, this.title, this.description});

  ProjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientId =
        json['clientId'] != null ? ClientId.fromJson(json['clientId']) : null;
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    if (this.clientId != null) {
      data['clientId'] = this.clientId?.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class ClientId {
  String? sId;
  String? userName;
  String? email;

  ClientId({this.sId, this.userName, this.email});

  ClientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}

// class ProposedBudget {
//   String? numberDecimal;

//   ProposedBudget({this.numberDecimal});

//   ProposedBudget.fromJson(Map<String, dynamic> json) {
//     numberDecimal = json['numberDecimal'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['numberDecimal'] = this.numberDecimal;
//     return data;
//   }
// }
class ProposedBudget {
  String? numberDecimal;

  ProposedBudget({this.numberDecimal});

  ProposedBudget.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['\$numberDecimal']; // Escape the '$' symbol
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['\$numberDecimal'] = this.numberDecimal; // Escape the '$' symbol
    return data;
  }
}

class FreelancerDetails {
  String? sId;
  String? user;
  String? firstName;
  String? lastName;
  String? profileImage;

  FreelancerDetails(
      {this.sId, this.user, this.firstName, this.lastName, this.profileImage});

  FreelancerDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profileImage'] = this.profileImage;
    return data;
  }
}
