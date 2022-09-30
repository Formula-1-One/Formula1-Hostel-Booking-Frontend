class booking_data {
  Data? data;
  String? errorMessage;

  booking_data({this.data, this.errorMessage});

  booking_data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error_message'] = this.errorMessage;
    return data;
  }
}

class Data {
  String? authToken;
  List<Hostels>? hostels;
  StudentProfile? studentProfile;

  Data({this.authToken, this.hostels, this.studentProfile});

  Data.fromJson(Map<String, dynamic> json) {
    authToken = json['auth-token'];
    if (json['hostels'] != null) {
      hostels = <Hostels>[];
      json['hostels'].forEach((v) {
        hostels!.add(new Hostels.fromJson(v));
      });
    }
    studentProfile = json['student_profile'] != null
        ? new StudentProfile.fromJson(json['student_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth-token'] = this.authToken;
    if (this.hostels != null) {
      data['hostels'] = this.hostels!.map((v) => v.toJson()).toList();
    }
    if (this.studentProfile != null) {
      data['student_profile'] = this.studentProfile!.toJson();
    }
    return data;
  }
}

class Hostels {
  int? hostelId;
  String? location;
  String? name;
  int? ratings;

  Hostels({this.hostelId, this.location, this.name, this.ratings});

  Hostels.fromJson(Map<String, dynamic> json) {
    hostelId = json['hostel_id'];
    location = json['location'];
    name = json['name'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hostel_id'] = this.hostelId;
    data['location'] = this.location;
    data['name'] = this.name;
    data['ratings'] = this.ratings;
    return data;
  }
}

class StudentProfile {
  String? firstName;
  String? gender;
  String? lastName;
  String? otherNames;
  String? phoneNumber;
  String? programOfStudy;
  String? referenceNumber;

  StudentProfile(
      {this.firstName,
        this.gender,
        this.lastName,
        this.otherNames,
        this.phoneNumber,
        this.programOfStudy,
        this.referenceNumber});

  StudentProfile.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    gender = json['gender'];
    lastName = json['last_name'];
    otherNames = json['other_names'];
    phoneNumber = json['phone_number'];
    programOfStudy = json['program_of_study'];
    referenceNumber = json['reference_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['last_name'] = this.lastName;
    data['other_names'] = this.otherNames;
    data['phone_number'] = this.phoneNumber;
    data['program_of_study'] = this.programOfStudy;
    data['reference_number'] = this.referenceNumber;
    return data;
  }
}
