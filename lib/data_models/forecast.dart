class Forecast {
  final String location;
  final String latitude;
  final String longitude;
  final String intensity;
  final String percent;
  final String rainTime;
  final String notifyTime;
  final String forecastId;

//<editor-fold desc="Data Methods">

  const Forecast({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.intensity,
    required this.percent,
    required this.rainTime,
    required this.notifyTime,
    required this.forecastId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Forecast &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          intensity == other.intensity &&
          percent == other.percent &&
          rainTime == other.rainTime &&
          notifyTime == other.notifyTime &&
          forecastId == other.forecastId);

  @override
  int get hashCode =>
      location.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      intensity.hashCode ^
      percent.hashCode ^
      rainTime.hashCode ^
      notifyTime.hashCode ^
      forecastId.hashCode;

  @override
  String toString() {
    return 'Forecast{' +
        ' location: $location,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' intensity: $intensity,' +
        ' percent: $percent,' +
        ' rainTime: $rainTime,' +
        ' notifyTime: $notifyTime,' +
        ' forecastId: $forecastId,' +
        '}';
  }

  Forecast copyWith({
    String? location,
    String? latitude,
    String? longitude,
    String? intensity,
    String? percent,
    String? rainTime,
    String? notifyTime,
    String? forecastId,
  }) {
    return Forecast(
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      intensity: intensity ?? this.intensity,
      percent: percent ?? this.percent,
      rainTime: rainTime ?? this.rainTime,
      notifyTime: notifyTime ?? this.notifyTime,
      forecastId: forecastId ?? this.forecastId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'location': this.location,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'intensity': this.intensity,
      'percent': this.percent,
      'rainTime': this.rainTime,
      'notifyTime': this.notifyTime,
      'forecastId': this.forecastId,
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      location: map['location'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      intensity: map['intensity'] as String,
      percent: map['percent'] as String,
      rainTime: map['rainTime'] as String,
      notifyTime: map['notifyTime'] as String,
      forecastId: map['forecastId'] as String,
    );
  }

//</editor-fold>
}