import 'dart:convert';

class ProposalDataResponse {
  int? status;
  String? message;
  ProposalData? data;

  ProposalDataResponse({this.status, this.message, this.data});

  ProposalDataResponse.fromJson(Map<String, dynamic> json) {
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
  List<ProposalListData>? projects;
  int? currentPage;
  int? totalPages;
  int? totalProjects;

  ProposalData(
      {this.projects, this.currentPage, this.totalPages, this.totalProjects});

  ProposalData.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <ProposalListData>[];
      json['projects'].forEach((v) {
        projects!.add(ProposalListData.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalProjects = json['totalProjects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['totalProjects'] = totalProjects;
    return data;
  }
}

class ProposalListData {
  Budget? budget;
  String? sId;
  String? projectId; // Add projectId here
  ClientId? clientId;
  String? title;
  String? description;
  List<String>? category;
  List<String>? subCategory;
  List<String>? skillsRequired;
  String? deadline;
  String? experienceLevel;
  String? attachment;
  String? timelineType;
  List<String>? projectTime;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProposalListData({
    this.budget,
    this.sId,
    this.projectId, // Initialize projectId
    this.clientId,
    this.title,
    this.description,
    this.category,
    this.subCategory,
    this.skillsRequired,
    this.deadline,
    this.experienceLevel,
    this.attachment,
    this.timelineType,
    this.projectTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ProposalListData.fromJson(Map<String, dynamic> json) {
    budget = json['budget'] != null ? Budget.fromJson(json['budget']) : null;
    sId = json['_id'];
    projectId = json['projectId']; // Parse projectId from JSON
    clientId =
        json['clientId'] != null ? ClientId.fromJson(json['clientId']) : null;
    title = json['title'];
    description = json['description'];
    category = json['category'].cast<String>();
    subCategory = json['subCategory'].cast<String>();
    skillsRequired = json['skillsRequired'].cast<String>();
    deadline = json['deadline'];
    experienceLevel = json['experienceLevel'];
    attachment = json['Attachment'];
    timelineType = json['TimelineType'];
    projectTime = json['projectTime'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (budget != null) {
      data['budget'] = budget!.toJson();
    }
    data['_id'] = sId;
    data['projectId'] = projectId; // Include projectId in toJson
    if (clientId != null) {
      data['clientId'] = clientId!.toJson();
    }
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['skillsRequired'] = skillsRequired;
    data['deadline'] = deadline;
    data['experienceLevel'] = experienceLevel;
    data['Attachment'] = attachment;
    data['TimelineType'] = timelineType;
    data['projectTime'] = projectTime;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Budget {
  int? min;
  int? max;

  Budget({this.min, this.max});

  Budget.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    return data;
  }
}

ProposalDataResponse getProposalDataResponse(String str) {
  final jsonData = json.decode(str);
  return ProposalDataResponse.fromJson(jsonData);
}
