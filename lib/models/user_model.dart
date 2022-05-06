import 'dart:convert';

class UserModel {
  UserModel({
    required this.location,
    required this.id,
    required this.phone,
    required this.countryCode,
    required this.profileCompletion,
    required this.isBlocked,
    required this.bio,
    required this.bmi,
    required this.connectedUsers,
    required this.dob,
    required this.gender,
    required this.height,
    required this.hip,
    required this.name,
    required this.neck,
    required this.profileImages,
    required this.profileVerified,
    required this.username,
    required this.waist,
    required this.weight,
  });

  Location location;
  String id;
  String phone;
  String countryCode;
  int profileCompletion;
  bool isBlocked;
  String bio;
  double bmi;
  List<dynamic> connectedUsers;
  DateTime dob;
  String gender;
  double height;
  int hip;
  String name;
  double neck;
  List<dynamic> profileImages;
  bool profileVerified;
  String username;
  double waist;
  int weight;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        location: Location.fromMap(json["location"]),
        id: json["_id"],
        phone: json["phone"],
        countryCode: json["country_code"],
        profileCompletion: json["profile_completion"],
        isBlocked: json["is_blocked"],
        bio: json["bio"],
        bmi: json["bmi"].toDouble(),
        connectedUsers:
            List<dynamic>.from(json["connected_users"].map((x) => x)),
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        height: json["height"].toDouble(),
        hip: json["hip"],
        name: json["name"],
        neck: json["neck"].toDouble(),
        profileImages: List<dynamic>.from(json["profile_images"].map((x) => x)),
        profileVerified: json["profile_verified"],
        username: json["username"],
        waist: json["waist"].toDouble(),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "_id": id,
        "phone": phone,
        "country_code": countryCode,
        "profile_completion": profileCompletion,
        "is_blocked": isBlocked,
        "bio": bio,
        "bmi": bmi,
        "connected_users": List<dynamic>.from(connectedUsers.map((x) => x)),
        "dob": dob.toIso8601String(),
        "gender": gender,
        "height": height,
        "hip": hip,
        "name": name,
        "neck": neck,
        "profile_images": List<dynamic>.from(profileImages.map((x) => x)),
        "profile_verified": profileVerified,
        "username": username,
        "waist": waist,
        "weight": weight,
      };
}

class Location {
  Location({
    required this.coordinates,
    required this.type,
  });

  List<double> coordinates;
  String type;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}
