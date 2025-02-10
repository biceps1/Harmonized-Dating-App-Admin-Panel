class ReportModel {
  String? id;
  String? userId;
  String? title;
  String? description;
  String? status; // New field: "Pending" or "Resolved"
  DateTime? createdAt;

  ReportModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.status = "Pending", // Default to "Pending"
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      status: json['status'] ?? "Pending",
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}