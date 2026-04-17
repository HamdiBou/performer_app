class ConferenceConfig {
  final String id;
  final String name;
  final String apiUrl;
  final String primaryColorHex;

  const ConferenceConfig({
    required this.id,
    required this.name,
    required this.apiUrl,
    required this.primaryColorHex,
  });

  factory ConferenceConfig.fromJson(Map<String, dynamic> json) {
    return ConferenceConfig(
      id: json['id'] as String,
      name: json['name'] as String,
      apiUrl: json['apiUrl'] as String,
      primaryColorHex: json['primaryColorHex'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'apiUrl': apiUrl,
    'primaryColorHex': primaryColorHex,
  };
}
