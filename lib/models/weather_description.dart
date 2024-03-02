class WeatherDescription {
  final String description;
  final String icon;
  

  WeatherDescription({required this.description, required this.icon});
  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherDescription(description: description, icon: icon);
    
  }
}



