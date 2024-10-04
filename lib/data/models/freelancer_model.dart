class FreelancerDetail {
  int? status;
  String? message;
  Data? data;

  FreelancerDetail({this.status, this.message, this.data});

  FreelancerDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  UserDetails? userDetails;

  Data({this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails?.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? sId;
  User? user;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? pincode;
  String? country;
  String? title;
  List<Experience>? experience;
  List<Education>? education;
  List<String>? skills;
  List<Languages>? languages;
  String? profileDescription;
  int? hourlyRate;
  String? phoneNumber;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<dynamic>? personalProjects;

  UserDetails({
    this.sId,
    this.user,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.pincode,
    this.country,
    this.title,
    this.experience,
    this.education,
    this.skills,
    this.languages,
    this.profileDescription,
    this.hourlyRate,
    this.phoneNumber,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.personalProjects,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    city = json['city'];
    pincode = json['pincode'];
    country = json['country'];
    title = json['title'];
    if (json['experience'] != null) {
      experience = (json['experience'] as List)
          .map((v) => Experience.fromJson(v))
          .toList();
    }
    if (json['education'] != null) {
      education = (json['education'] as List)
          .map((v) => Education.fromJson(v))
          .toList();
    }
    skills = json['skills'] != null ? List<String>.from(json['skills']) : [];
    if (json['languages'] != null) {
      languages = (json['languages'] as List)
          .map((v) => Languages.fromJson(v))
          .toList();
    }
    profileDescription = json['profileDescription'];
    hourlyRate = json['hourlyRate'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['personalProjects'] != null) {
      personalProjects = [];
      json['personalProjects'].forEach((v) {
        personalProjects?.add(PersonalProjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['country'] = this.country;
    data['title'] = this.title;
    if (this.experience != null) {
      data['experience'] = this.experience?.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education?.map((v) => v.toJson()).toList();
    }
    data['skills'] = this.skills;
    if (this.languages != null) {
      data['languages'] = this.languages?.map((v) => v.toJson()).toList();
    }
    data['profileDescription'] = this.profileDescription;
    data['hourlyRate'] = this.hourlyRate;
    data['phoneNumber'] = this.phoneNumber;
    data['profileImage'] = this.profileImage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.personalProjects != null) {
      data['personalProjects'] =
          this.personalProjects?.map((v) => v.toJson()).toList();
    }
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
  List<dynamic>? connections;

  User({
    this.sId,
    this.userName,
    this.email,
    this.password,
    this.isClient,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.resetPasswordExpires,
    this.resetPasswordOTP,
    this.connections,
  });

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
    connections = json['connections'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data['connections'] = this.connections;
    return data;
  }
}

class Experience {
  String? companyName;
  String? role;
  String? duration;
  String? description;
  String? employmentType;
  String? location;
  String? startDate;
  String? endDate;
  String? sId;

  Experience({
    this.companyName,
    this.role,
    this.duration,
    this.description,
    this.employmentType,
    this.location,
    this.startDate,
    this.endDate,
    this.sId,
  });

  Experience.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    role = json['role'];
    duration = json['duration'];
    description = json['description'];
    employmentType = json['employmentType'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['companyName'] = this.companyName;
    data['role'] = this.role;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['employmentType'] = this.employmentType;
    data['location'] = this.location;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['_id'] = this.sId;
    return data;
  }
}

class Education {
  String? institutionName;
  String? degree;
  String? yearOfCompletion;
  String? fieldOfStudy;
  String? location;
  String? startDate;
  String? endDate;
  String? sId;

  Education({
    this.institutionName,
    this.degree,
    this.yearOfCompletion,
    this.fieldOfStudy,
    this.location,
    this.startDate,
    this.endDate,
    this.sId,
  });

  Education.fromJson(Map<String, dynamic> json) {
    institutionName = json['institutionName'];
    degree = json['degree'];
    yearOfCompletion = json['yearOfCompletion'];
    fieldOfStudy = json['fieldOfStudy'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['institutionName'] = this.institutionName;
    data['degree'] = this.degree;
    data['yearOfCompletion'] = this.yearOfCompletion;
    data['fieldOfStudy'] = this.fieldOfStudy;
    data['location'] = this.location;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['_id'] = this.sId;
    return data;
  }
}

class Languages {
  String? name;
  String? proficiency;
  String? sId;

  Languages({this.name, this.proficiency, this.sId});

  Languages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    proficiency = json['proficiency'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['proficiency'] = this.proficiency;
    data['_id'] = this.sId;
    return data;
  }
}

class PersonalProjects {
  String? projectName;
  String? description;
  String? startDate;
  String? endDate;
  List<String>? technologies;
  bool? isOngoing;
  String? sId;

  PersonalProjects(
      {this.projectName,
      this.description,
      this.startDate,
      this.endDate,
      this.technologies,
      this.isOngoing,
      this.sId});

  PersonalProjects.fromJson(Map<String, dynamic> json) {
    projectName = json['projectName'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    technologies = json['technologies'].cast<String>();
    isOngoing = json['isOngoing'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectName'] = this.projectName;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['technologies'] = this.technologies;
    data['isOngoing'] = this.isOngoing;
    data['_id'] = this.sId;
    return data;
  }
}
