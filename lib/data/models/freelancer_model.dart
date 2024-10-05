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
    data['status'] = status;
    data['message'] = message;
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
    if (userDetails != null) {
      data['userDetails'] = userDetails?.toJson();
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
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['address'] = address;
    data['city'] = city;
    data['pincode'] = pincode;
    data['country'] = country;
    data['title'] = title;
    if (experience != null) {
      data['experience'] = experience?.map((v) => v.toJson()).toList();
    }
    if (education != null) {
      data['education'] = education?.map((v) => v.toJson()).toList();
    }
    data['skills'] = skills;
    if (languages != null) {
      data['languages'] = languages?.map((v) => v.toJson()).toList();
    }
    data['profileDescription'] = profileDescription;
    data['hourlyRate'] = hourlyRate;
    data['phoneNumber'] = phoneNumber;
    data['profileImage'] = profileImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (personalProjects != null) {
      data['personalProjects'] =
          personalProjects?.map((v) => v.toJson()).toList();
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
    data['connections'] = connections;
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
    data['companyName'] = companyName;
    data['role'] = role;
    data['duration'] = duration;
    data['description'] = description;
    data['employmentType'] = employmentType;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['_id'] = sId;
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
    data['institutionName'] = institutionName;
    data['degree'] = degree;
    data['yearOfCompletion'] = yearOfCompletion;
    data['fieldOfStudy'] = fieldOfStudy;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['_id'] = sId;
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
    data['name'] = name;
    data['proficiency'] = proficiency;
    data['_id'] = sId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectName'] = projectName;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['technologies'] = technologies;
    data['isOngoing'] = isOngoing;
    data['_id'] = sId;
    return data;
  }
}
