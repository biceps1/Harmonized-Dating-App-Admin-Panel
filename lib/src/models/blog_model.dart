class BlogModel {
  String id;
  String title;
  List<dynamic> content;
  String imageUrl;
  String tags;
  String category;
  DateTime createdAt;

  BlogModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.tags,
    required this.category,
    required this.createdAt,
  });

  // Convert BlogModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'tags': tags,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert JSON to BlogModel
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? [],
      imageUrl: json['imageUrl'] ?? '',
      tags: json['tags'] ?? '',
      category: json['category'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
