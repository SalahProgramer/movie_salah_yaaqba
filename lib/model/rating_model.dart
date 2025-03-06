class RatingModel {
  String? source;
  String? value;

  RatingModel({required this.source, required this.value});

  RatingModel.fromJson(Map<String, dynamic> json) {
    source = json['Source'] ?? '';
    value = json['Value'] ?? '';
  }

  @override
  String toString() {
    return 'Rating{source: $source, value: $value}';
  }
}