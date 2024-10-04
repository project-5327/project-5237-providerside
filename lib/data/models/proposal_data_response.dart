import 'dart:convert';

class ProposalDataResponse {
  int? status;
  String? message;
  ProposalData? data;

  ProposalDataResponse({this.status, this.message, this.data});

  ProposalDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new ProposalData.fromJson(json['data']) : null;
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
        projects!.add(new ProposalListData.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalProjects = json['totalProjects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalProjects'] = this.totalProjects;
    return data;
  }
}

class ProposalListData {
  Budget? budget;
  String? sId;
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

  ProposalListData(
      {this.budget,
      this.sId,
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
      this.iV});

  ProposalListData.fromJson(Map<String, dynamic> json) {
    budget =
        json['budget'] != null ? new Budget.fromJson(json['budget']) : null;
    sId = json['_id'];
    clientId = json['clientId'] != null
        ? new ClientId.fromJson(json['clientId'])
        : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.budget != null) {
      data['budget'] = this.budget!.toJson();
    }
    data['_id'] = this.sId;
    if (this.clientId != null) {
      data['clientId'] = this.clientId!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['skillsRequired'] = this.skillsRequired;
    data['deadline'] = this.deadline;
    data['experienceLevel'] = this.experienceLevel;
    data['Attachment'] = this.attachment;
    data['TimelineType'] = this.timelineType;
    data['projectTime'] = this.projectTime;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}

ProposalDataResponse getProposalDataResponse(String str) {
  final jsonData = json.decode(str);
  return ProposalDataResponse.fromJson(jsonData);
}
