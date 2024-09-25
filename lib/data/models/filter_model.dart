class FilterModel {
  int? status;
  String? message;
  List<Projects>? projects;

  FilterModel({this.status, this.message, this.projects});

  FilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['projects'] != null) {
      projects = [];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  Budget? budget;
  List<String>? projectTime;
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
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Projects({
    this.budget,
    this.projectTime,
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
    this.status,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Projects.fromJson(Map<String, dynamic> json) {
    budget = json['budget'] != null ? Budget.fromJson(json['budget']) : null;
    projectTime = json['projectTime']?.cast<String>();
    sId = json['_id'];
    clientId =
        json['clientId'] != null ? ClientId.fromJson(json['clientId']) : null;
    title = json['title'];
    description = json['description'];
    category = json['category']?.cast<String>();
    subCategory = json['subCategory']?.cast<String>();
    skillsRequired = json['skillsRequired']?.cast<String>();
    deadline = json['deadline'];
    experienceLevel = json['experienceLevel'];
    attachment = json['Attachment'];
    timelineType = json['TimelineType'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (budget != null) {
      data['budget'] = budget!.toJson();
    }
    data['projectTime'] = projectTime;
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
    data['Attachment'] = attachment; // Consider using lower case if needed
    data['TimelineType'] = timelineType; // Consider using lower case if needed
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
    final Map<String, dynamic> data = {};
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
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    return data;
  }
}
