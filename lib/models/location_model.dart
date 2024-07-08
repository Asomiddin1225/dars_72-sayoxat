class LocationModel {
  String id;
  String title;
  String photoUrl;
  double latitude;
  double longitude;

  LocationModel({
    required this.id,
    required this.title,
    required this.photoUrl,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      title: json['title'],
      photoUrl: json['photoUrl'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'photoUrl': photoUrl,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
