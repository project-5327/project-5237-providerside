// class FreelancerDetails {
//   int? status;
//   String? message;
//   Data data;

//   FreelancerDetails({this.status, this.message, this.data});

//   FreelancerDetails.fromJson(Map<String, dynamic> json) {
//     status = json['status'] ?? 0; // Provide a default value
//     message = json['message'] ?? ''; // Provide a default value
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data?.toJson(),
//     };
//   }
// }

// class Data {
//   UserDetails userDetails;

//   Data({required this.userDetails});

//   Data.fromJson(Map<String, dynamic> json) {
//     userDetails = (json['userDetails'] != null
//         ? UserDetails.fromJson(json['userDetails'])
//         : null)!;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'userDetails': userDetails?.toJson(),
//     };
//   }
// }

// class UserDetails {
//   String sId;
//   String user;
//   String firstName;
//   String lastName;
//   String address;
//   String city;
//   String pincode;
//   String country;
//   String title;
//   List<Experience> experience;
//   List<Education> education;
//   List<String> skills;
//   List<Languages> languages;
//   String profileDescription;
//   int hourlyRate;
//   String phoneNumber;
//   String profileImage;
//   String createdAt;
//   String updatedAt;
//   int iV;
//   List<PersonalProjects> personalProjects;

//   UserDetails({
//     this.sId,
//     this.user,
//     this.firstName,
//     this.lastName,
//     this.address,
//     this.city,
//     this.pincode,
//     this.country,
//     this.title,
//     this.experience,
//     this.education,
//     this.skills,
//     this.languages,
//     this.profileDescription,
//     this.hourlyRate,
//     this.phoneNumber,
//     this.profileImage,
//     this.createdAt,
//     this.updatedAt,
//     this.iV,
//     this.personalProjects,
//   });

//   UserDetails.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     user = json['user'] ?? '';
//     firstName = json['firstName'] ?? '';
//     lastName = json['lastName'] ?? '';
//     address = json['address'] ?? '';
//     city = json['city'] ?? '';
//     pincode = json['pincode'] ?? '';
//     country = json['country'] ?? '';
//     title = json['title'] ?? '';

//     experience = (json['experience'] as List)
//             ?.map((e) => Experience.fromJson(e))
//             ?.toList() ??
//         [];
//     education = (json['education'] as List)
//             ?.map((e) => Education.fromJson(e))
//             ?.toList() ??
//         [];

//     skills = List<String>.from(json['skills'] ?? []);
//     languages = (json['languages'] as List)
//             ?.map((e) => Languages.fromJson(e))
//             ?.toList() ??
//         [];

//     profileDescription = json['profileDescription'] ?? '';
//     hourlyRate = json['hourlyRate'] ?? 0; // Provide a default value
//     phoneNumber = json['phoneNumber'] ?? '';
//     profileImage = json['profileImage'] ?? '';
//     createdAt = json['createdAt'] ?? '';
//     updatedAt = json['updatedAt'] ?? '';
//     iV = json['__v'] ?? 0; // Provide a default value
//     personalProjects = (json['personalProjects'] as List)
//             ?.map((e) => PersonalProjects.fromJson(e))
//             ?.toList() ??
//         [];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': sId,
//       'user': user,
//       'firstName': firstName,
//       'lastName': lastName,
//       'address': address,
//       'city': city,
//       'pincode': pincode,
//       'country': country,
//       'title': title,
//       'experience': experience?.map((e) => e.toJson())?.toList(),
//       'education': education?.map((e) => e.toJson())?.toList(),
//       'skills': skills,
//       'languages': languages?.map((e) => e.toJson())?.toList(),
//       'profileDescription': profileDescription,
//       'hourlyRate': hourlyRate,
//       'phoneNumber': phoneNumber,
//       'profileImage': profileImage,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       '__v': iV,
//       'personalProjects': personalProjects?.map((e) => e.toJson())?.toList(),
//     };
//   }
// }

// class Experience {
//   String companyName;
//   String role;
//   String duration;
//   String description;
//   String employmentType;
//   String location;
//   String startDate;
//   String endDate;
//   String sId;

//   Experience({
//     this.companyName,
//     this.role,
//     this.duration,
//     this.description,
//     this.employmentType,
//     this.location,
//     this.startDate,
//     this.endDate,
//     this.sId,
//   });

//   Experience.fromJson(Map<String, dynamic> json) {
//     companyName = json['companyName'] ?? '';
//     role = json['role'] ?? '';
//     duration = json['duration'] ?? '';
//     description = json['description'] ?? '';
//     employmentType = json['employmentType'] ?? '';
//     location = json['location'] ?? '';
//     startDate = json['startDate'] ?? '';
//     endDate = json['endDate'] ?? '';
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'companyName': companyName,
//       'role': role,
//       'duration': duration,
//       'description': description,
//       'employmentType': employmentType,
//       'location': location,
//       'startDate': startDate,
//       'endDate': endDate,
//       '_id': sId,
//     };
//   }
// }

// class Education {
//   String institutionName;
//   String degree;
//   String yearOfCompletion;
//   String location;
//   String startDate;
//   String endDate;
//   String sId;

//   Education({
//     this.institutionName,
//     this.degree,
//     this.yearOfCompletion,
//     this.location,
//     this.startDate,
//     this.endDate,
//     this.sId,
//   });

//   Education.fromJson(Map<String, dynamic> json) {
//     institutionName = json['institutionName'] ?? '';
//     degree = json['degree'] ?? '';
//     yearOfCompletion = json['yearOfCompletion'] ?? '';
//     location = json['location'] ?? '';
//     startDate = json['startDate'] ?? '';
//     endDate = json['endDate'] ?? '';
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'institutionName': institutionName,
//       'degree': degree,
//       'yearOfCompletion': yearOfCompletion,
//       'location': location,
//       'startDate': startDate,
//       'endDate': endDate,
//       '_id': sId,
//     };
//   }
// }

// class Languages {
//   String languageName;
//   String proficiencyLevel;
//   String sId;

//   Languages({this.languageName, this.proficiencyLevel, this.sId});

//   Languages.fromJson(Map<String, dynamic> json) {
//     languageName = json['languageName'] ?? '';
//     proficiencyLevel = json['proficiencyLevel'] ?? '';
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'languageName': languageName,
//       'proficiencyLevel': proficiencyLevel,
//       '_id': sId,
//     };
//   }
// }

// class PersonalProjects {
//   String projectName;
//   String description;
//   String startDate;
//   String endDate;
//   List<String> technologies;
//   bool isOngoing;
//   String sId;

//   PersonalProjects({
//     this.projectName,
//     this.description,
//     this.startDate,
//     this.endDate,
//     this.technologies,
//     this.isOngoing,
//     this.sId,
//   });

//   PersonalProjects.fromJson(Map<String, dynamic> json) {
//     projectName = json['projectName'] ?? '';
//     description = json['description'] ?? '';
//     startDate = json['startDate'] ?? '';
//     endDate = json['endDate'] ?? '';
//     technologies = List<String>.from(json['technologies'] ?? []);
//     isOngoing = json['isOngoing'] ?? false; // Provide a default value
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'projectName': projectName,
//       'description': description,
//       'startDate': startDate,
//       'endDate': endDate,
//       'technologies': technologies,
//       'isOngoing': isOngoing,
//       '_id': sId,
//     };
//   }
// }
