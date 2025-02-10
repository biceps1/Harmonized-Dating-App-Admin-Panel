import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? email;
  final String? name;
  final String? gender;
  final String? dob;
  final String? token;
  final String status;
  final String? sect;
  final String? profession;
  final String? education;
  final List<String>? interests;
  final List<String>? notInterested;
  final List<String>? interestedIn;
  final List<String>? images;
  final String? otherDetails;
  final DateTime? createdAt;
  final String? uid;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? childrenPlan;
  final String? reportStatus; // New field added here
  List<String>? blockedUserIds;

  UserModel(
      {this.email,
      this.name,
      this.gender,
      this.dob,
      this.token,
      this.status = "New",
      this.sect,
      this.profession,
      this.education,
      this.interests,
      this.notInterested,
      this.images,
      this.otherDetails,
      this.createdAt,
      this.uid,
      this.location,
      this.latitude,
      this.longitude,
      this.interestedIn,
      this.childrenPlan,
      this.reportStatus, // New field added here
      this.blockedUserIds});

  // Convert a UserModel object into a map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'gender': gender,
      'dob': dob,
      'token': token,
      'sect': sect,
      'status': status,
      'profession': profession,
      'education': education,
      'interests': interests,
      'notInterested': notInterested,
      'images': images,
      'other_details': otherDetails,
      'created_at': createdAt?.toIso8601String(),
      'uid': uid,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'interested_in': interestedIn,
      'children_plan': childrenPlan,
      'reportStatus': reportStatus, // New field added here
      'blockedUserIds': blockedUserIds,
    };
  }

  // Create a UserModel object from JSON data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      gender: json['gender'],
      status: json['status'] ?? "New",
      dob: json['dob'].toString() ?? "",
      token: json['token'].toString(),
      sect: json['sect'],
      childrenPlan: json['children_plan'],
      profession: json['profession'],
      education: json['education'],
      interests: List<String>.from(json['interests'] ?? []),
      notInterested: List<String>.from(json['notInterested'] ?? []),
      images: List<String>.from(json['images'] ?? []),
      otherDetails: json['other_details'],
      createdAt: json['created_at'] != null
          ? (json['created_at'] is Timestamp
              ? (json['created_at'] as Timestamp).toDate()
              : DateTime.parse(json['created_at']))
          : null,
      uid: json['uid'],
      location: json['location'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      interestedIn: List<String>.from(json['interested_in'] ?? []),
      reportStatus: json['reportStatus'], // New field added here
      blockedUserIds: List<String>.from(json['blockedUserIds'] ?? []),
    );
  }

  // Copy the UserModel with updated values
  UserModel copyWith({
    String? email,
    String? name,
    String? gender,
    String? dob,
    String? sect,
    String? status,
    String? profession,
    String? education,
    List<String>? interests,
    List<String>? notInterested,
    List<String>? images,
    String? otherDetails,
    DateTime? createdAt,
    String? uid,
    String? location,
    double? latitude,
    double? longitude,
    String? reportStatus, // New field added here
    List<String>? blockedUserIds,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      sect: sect ?? this.sect,
      profession: profession ?? this.profession,
      education: education ?? this.education,
      status: status ?? this.status,
      interests: interests ?? this.interests,
      notInterested: notInterested ?? this.notInterested,
      images: images ?? this.images,
      otherDetails: otherDetails ?? this.otherDetails,
      createdAt: createdAt ?? this.createdAt,
      uid: uid ?? this.uid,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      reportStatus: reportStatus ?? this.reportStatus, // New field added here
      blockedUserIds: blockedUserIds ?? this.blockedUserIds,
    );
  }
}