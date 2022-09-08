class User {
  final String userId;
  final String forecastId;
  final String location;

//<editor-fold desc="Data Methods">

  const User({
    required this.userId,
    required this.forecastId,
    required this.location,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          forecastId == other.forecastId &&
          location == other.location);

  @override
  int get hashCode => userId.hashCode ^ forecastId.hashCode ^ location.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' userId: $userId,' +
        ' forecastId: $forecastId,' +
        ' location: $location,' +
        '}';
  }

  User copyWith({
    String? userId,
    String? forecastId,
    String? location,
  }) {
    return User(
      userId: userId ?? this.userId,
      forecastId: forecastId ?? this.forecastId,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'forecastId': this.forecastId,
      'location': this.location,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      forecastId: map['forecastId'] as String,
      location: map['location'] as String,
    );
  }

//</editor-fold>
}