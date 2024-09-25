class GetProposalByProvider {
  int? status;
  String? message;
  List<Data>? data;

  GetProposalByProvider({this.status, this.message, this.data});

  GetProposalByProvider.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null && json['data'] is List) {
      // Check if data is a List
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    } else if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      // If data is a map (in case it's not a list but a single object)
      data = [Data.fromJson(json['data'])];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['status'] = this.status;
    dataMap['message'] = this.message;

    if (this.data != null) {
      dataMap['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class Data {
  String? sId;
  ProjectId? projectId;
  UserId? userId;
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
  UserDetails? userDetails;
  String? freelancerId;
  String? submittedAt;

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
      this.userDetails,
      this.freelancerId,
      this.submittedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    projectId = json['projectId'] != null
        ? ProjectId.fromJson(json['projectId'])
        : null;
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    proposalTitle = json['proposalTitle'];
    proposalDescription = json['proposalDescription'];
    estimatedTime = json['estimatedTime'];
    proposedBudget = json['proposedBudget'] != null
        ? ProposedBudget.fromJson(json['proposedBudget'])
        : null;
    status = json['status'];
    address = json['address'];
    proposalImage = (json['proposalImage'] != null)
        ? List<String>.from(json['proposalImage'])
        : [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
    freelancerId = json['freelancerId'];
    submittedAt = json['submittedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    if (this.projectId != null) {
      data['projectId'] = this.projectId?.toJson();
    }
    if (this.userId != null) {
      data['userId'] = this.userId?.toJson();
    }
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
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails?.toJson();
    }
    data['freelancerId'] = this.freelancerId;
    data['submittedAt'] = this.submittedAt;
    return data;
  }
}

class ProjectId {
  String? sId;
  String? title;
  String? description;

  ProjectId({this.sId, this.title, this.description});

  ProjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

class UserId {
  String? sId;
  String? userName;
  String? email;

  UserId({this.sId, this.userName, this.email});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}

class ProposedBudget {
  String? numberDecimal;

  ProposedBudget({this.numberDecimal});

  ProposedBudget.fromJson(Map<String, dynamic> json) {
    numberDecimal =
        json['\$numberDecimal']; // Updated to ensure proper key lookup
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['\$numberDecimal'] = this.numberDecimal;
    return data;
  }
}

class UserDetails {
  String? profileImage;
  String? firstName;
  String? lastName;

  UserDetails({this.profileImage, this.firstName, this.lastName});

  UserDetails.fromJson(Map<String, dynamic> json) {
    profileImage = json['profileImage'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileImage'] = this.profileImage;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}


// class GetProposalByProvider {
//   int? status;
//   String? message;
//   List<Data>? data;

//   GetProposalByProvider({this.status, this.message, this.data});

//   GetProposalByProvider.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       (json['data'] as List).map((v) => Data.fromJson(v)).toList();
//     }
//     ;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   ProjectId? projectId;
//   UserId? userId;
//   String? proposalTitle;
//   String? proposalDescription;
//   int? estimatedTime;
//   ProposedBudget? proposedBudget;
//   String? status;
//   String? address;
//   List<String>? proposalImage;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   UserDetails? userDetails;
//   String? freelancerId;
//   String? submittedAt;

//   Data(
//       {this.sId,
//       this.projectId,
//       this.userId,
//       this.proposalTitle,
//       this.proposalDescription,
//       this.estimatedTime,
//       this.proposedBudget,
//       this.status,
//       this.address,
//       this.proposalImage,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.userDetails,
//       this.freelancerId,
//       this.submittedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     projectId = json['projectId'] != null
//         ? ProjectId.fromJson(json['projectId'])
//         : null;
//     userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
//     proposalTitle = json['proposalTitle'];
//     proposalDescription = json['proposalDescription'];
//     estimatedTime = json['estimatedTime'];
//     proposedBudget = json['proposedBudget'] != null
//         ? ProposedBudget.fromJson(json['proposedBudget'])
//         : null;
//     status = json['status'];
//     address = json['address'];
//     proposalImage = List<String>.from(json['proposalImage'] ?? []);
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     userDetails = json['userDetails'] != null
//         ? UserDetails.fromJson(json['userDetails'])
//         : null;
//     freelancerId = json['freelancerId'];
//     submittedAt = json['submittedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     if (projectId != null) {
//       data['projectId'] = projectId?.toJson();
//     }
//     if (userId != null) {
//       data['userId'] = userId?.toJson();
//     }
//     data['proposalTitle'] = proposalTitle;
//     data['proposalDescription'] = proposalDescription;
//     data['estimatedTime'] = estimatedTime;
//     if (proposedBudget != null) {
//       data['proposedBudget'] = proposedBudget?.toJson();
//     }
//     data['status'] = status;
//     data['address'] = address;
//     data['proposalImage'] = proposalImage;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     if (userDetails != null) {
//       data['userDetails'] = userDetails?.toJson();
//     }
//     data['freelancerId'] = freelancerId;
//     data['submittedAt'] = submittedAt;
//     return data;
//   }
// }

// class ProjectId {
//   String? sId;
//   String? title;
//   String? description;

//   ProjectId({this.sId, this.title, this.description});

//   ProjectId.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['title'] = title;
//     data['description'] = description;
//     return data;
//   }
// }

// class UserId {
//   String? sId;
//   String? userName;
//   String? email;

//   UserId({this.sId, this.userName, this.email});

//   UserId.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     userName = json['userName'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['userName'] = userName;
//     data['email'] = email;
//     return data;
//   }
// }

// class ProposedBudget {
//   String? numberDecimal;

//   ProposedBudget({this.numberDecimal});

//   ProposedBudget.fromJson(Map<String, dynamic> json) {
//     numberDecimal = json['numberDecimal']; // Fixed the key name
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['numberDecimal'] = numberDecimal;
//     return data;
//   }
// }

// class UserDetails {
//   String? profileImage;
//   String? firstName;
//   String? lastName;

//   UserDetails({this.profileImage, this.firstName, this.lastName});

//   UserDetails.fromJson(Map<String, dynamic> json) {
//     profileImage = json['profileImage'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['profileImage'] = profileImage;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     return data;
//   }
// }
