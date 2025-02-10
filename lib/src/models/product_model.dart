

class ProductModel {
  String? uid;
  String? title;
  String? description;
  double? price;
  List<String>? images; // URLs or paths to images
  String? category;
  String? subcategory;
  String? condition; // For items: New, Used | For property: Rent, Sale
  Map<String, dynamic>? attributes; // Dynamic attributes based on category
  bool? deliverable; // True if delivery or shipping is available
  String? sellerUid; // Replaces sellerName and sellerContact
  String? soldToUid; // UID of the buyer if the item is sold
  bool? isSold; // Indicates if the product has been sold
  bool? isSponsored; // Indicates if the product is sponsored
  bool? isUrgentSponsored; // Indicates if the product is sponsored
  int? sponsoredDuration; // Duration in days for which the product is sponsored
  DateTime? sponsoredAt; // Date when the sponsorship started
  DateTime? endSponsoredDate; // Date when the sponsorship ends
  String? location; // String-based location, e.g., "New York, NY"
  double? latitude; // Latitude for map location
  double? longitude; // Longitude for map location
  DateTime? datePosted;
  bool? isDeleted;
  String? soldPrice;
  String? deletionReason;
  List<String>? totalViews;  // List of user IDs who viewed the product
  List<String>? totalCalls;  // List of user IDs who called about the product
  List<String>? totalChats;  // List of user IDs who initiated chats
  List<String>? totalSaved;  // List of user IDs who saved the product
  bool? isApproved;

  ProductModel({
    this.uid,
    this.title,
    this.description,
    this.price,
    this.images,
    this.category,
    this.subcategory,
    this.condition,
    this.attributes,
    this.deliverable,
    this.sellerUid,
    this.soldToUid,
    this.isSold,
    this.isApproved,
    this.isSponsored,
    this.sponsoredDuration,
    this.isUrgentSponsored,
    this.sponsoredAt,
    this.endSponsoredDate,
    this.location,
    this.latitude,
    this.longitude,
    this.datePosted,
    this.isDeleted,
    this.deletionReason,
    this.soldPrice,
    this.totalViews,
    this.totalCalls,
    this.totalChats,
    this.totalSaved,
  });

  // Convert Product to a map (JSON-like structure) for easier storage
  Map<String, dynamic> toJson() {
    return {
      'uid': uid ?? '',
      'title': title ?? '',
      'description': description ?? '',
      'price': price ?? 0.0,
      'images': images ?? [],
      'category': category ?? '',
      'subcategory': subcategory ?? '',
      'condition': condition ?? '',
      'attributes': attributes ?? {},
      'deliverable': deliverable ?? false,
      'sellerUid': sellerUid ?? '',
      'soldToUid': soldToUid ?? '',
      'isSold': isSold ?? false,
      'isApproved': isApproved ?? false,
      'isSponsored': isSponsored ?? false,
      'sponsoredDuration': sponsoredDuration ?? 0,
      'sponsoredAt': sponsoredAt?.toIso8601String() ?? '',
      'endSponsoredDate': endSponsoredDate?.toIso8601String() ?? '',
      'location': location ?? '',
      'latitude': latitude ?? 0.0,
      'longitude': longitude ?? 0.0,
      'datePosted': datePosted?.toIso8601String() ?? '',
      'isDeleted': isDeleted ?? false,
      'isUrgentSponsored': isUrgentSponsored ?? false,
      'deletionReason': deletionReason ?? '',
      'soldPrice': soldPrice ?? '',
      'totalViews': totalViews ?? [],
      'totalCalls': totalCalls ?? [],
      'totalChats': totalChats ?? [],
      'totalSaved': totalSaved ?? [],
    };
  }

  // Create a Product object from a map (JSON-like structure)
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      uid: map['uid'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      price: (map['price'] ?? 0.0) as double,
      images: List<String>.from(map['images'] ?? []),
      category: map['category'] as String?,
      subcategory: map['subcategory'] as String?,
      condition: map['condition'] as String?,
      attributes: Map<String, dynamic>.from(map['attributes'] ?? {}),
      deliverable: map['deliverable'] as bool? ?? false,
      sellerUid: map['sellerUid'] as String?,
      soldToUid: map['soldToUid'] as String?,
      isSold: map['isSold'] as bool? ?? false,
      isApproved: map['isApproved'] as bool? ?? false,
      isSponsored: map['isSponsored'] as bool? ?? false,
      isUrgentSponsored: map['isUrgentSponsored'] as bool? ?? false,
      sponsoredDuration: map['sponsoredDuration'] as int? ?? 0,
      sponsoredAt: map['sponsoredAt'] != null && map['sponsoredAt'] != ""
          ? DateTime.parse(map['sponsoredAt'])
          : null,
      endSponsoredDate: map['endSponsoredDate'] != null && map['endSponsoredDate'] != ""
          ? DateTime.parse(map['endSponsoredDate'])
          : null,
      location: map['location'] as String?,
      latitude: (map['latitude'] ?? 0.0) as double,
      longitude: (map['longitude'] ?? 0.0) as double,
      datePosted: map['datePosted'] != null && map['datePosted'] != ""
          ? DateTime.parse(map['datePosted'])
          : null,
      isDeleted: map['isDeleted'] as bool? ?? false,
      deletionReason: map['deletionReason'] as String?,
      soldPrice: map['soldPrice'] as String?,
      totalViews: List<String>.from(map['totalViews'] ?? []),
      totalCalls: List<String>.from(map['totalCalls'] ?? []),
      totalChats: List<String>.from(map['totalChats'] ?? []),
      totalSaved: List<String>.from(map['totalSaved'] ?? []),
    );
  }

  // Add this method to the Product model
  ProductModel copyWith({
    String? uid,
    String? title,
    String? description,
    double? price,
    List<String>? images,
    String? category,
    String? subcategory,
    String? condition,
    Map<String, dynamic>? attributes,
    bool? deliverable,
    String? sellerUid,
    String? soldToUid,
    bool? isSold,
    bool? isApproved,
    bool? isSponsored,
    int? sponsoredDuration,
    DateTime? sponsoredAt,
    DateTime? endSponsoredDate,
    String? location,
    double? latitude,
    double? longitude,
    DateTime? datePosted,
    bool? isDeleted,
    String? soldPrice,
    String? deletionReason,
    List<String>? totalViews,
    List<String>? totalCalls,
    List<String>? totalChats,
    List<String>? totalSaved,
  }) {
    return ProductModel(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      condition: condition ?? this.condition,
      attributes: attributes ?? this.attributes,
      deliverable: deliverable ?? this.deliverable,
      sellerUid: sellerUid ?? this.sellerUid,
      soldToUid: soldToUid ?? this.soldToUid,
      isSold: isSold ?? this.isSold,
      isApproved: isApproved ?? this.isApproved,
      isSponsored: isSponsored ?? this.isSponsored,
      sponsoredDuration: sponsoredDuration ?? this.sponsoredDuration,
      sponsoredAt: sponsoredAt ?? this.sponsoredAt,
      endSponsoredDate: endSponsoredDate ?? this.endSponsoredDate,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      datePosted: datePosted ?? this.datePosted,
      isDeleted: isDeleted ?? this.isDeleted,
      soldPrice: soldPrice ?? this.soldPrice,
      deletionReason: deletionReason ?? this.deletionReason,
      totalViews: totalViews ?? this.totalViews,
      totalCalls: totalCalls ?? this.totalCalls,
      totalChats: totalChats ?? this.totalChats,
      totalSaved: totalSaved ?? this.totalSaved,
    );
  }
}
