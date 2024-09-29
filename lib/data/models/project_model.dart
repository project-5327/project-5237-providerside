class ProjectModel {
  int? status;
  String? message;
  Data? data;

  ProjectModel({this.status, this.message, this.data});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<Projects>? projects;
  int? currentPage;
  int? totalPages;
  int? totalProjects;

  Data({this.projects, this.currentPage, this.totalPages, this.totalProjects});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
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

class Projects {
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
  List<String>? projectTime;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? timelineType;
  String? attachment;

  Projects(
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
      this.projectTime,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.timelineType,
      this.attachment});

  Projects.fromJson(Map<String, dynamic> json) {
    budget = json['budget'] != null ? Budget.fromJson(json['budget']) : null;
    sId = json['_id'];
    clientId =
        json['clientId'] != null ? ClientId.fromJson(json['clientId']) : null;
    title = json['title'];
    description = json['description'];
    category = List<String>.from(json['category'] ?? []);
    subCategory = List<String>.from(json['subCategory'] ?? []);
    skillsRequired = List<String>.from(json['skillsRequired'] ?? []);
    deadline = json['deadline'];
    experienceLevel = json['experienceLevel'];
    projectTime = List<String>.from(json['projectTime'] ?? []);
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    timelineType = json['TimelineType'];
    attachment = json['Attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (budget != null) {
      data['budget'] = budget!.toJson();
    }
    data['_id'] = sId;
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
    data['projectTime'] = projectTime;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['TimelineType'] = timelineType;
    data['Attachment'] = attachment;
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
  String? profileImage;

  ClientId({this.sId, this.userName, this.email, this.profileImage});

  ClientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    profileImage = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    data['profileImg'] = profileImage;
    return data;
  }
}
