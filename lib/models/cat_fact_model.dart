class CatFact {
  String fact;
  int length;
  CatFact({
    required this.fact,
    required this.length,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['fact'],
      length: json['length'],
    );
  }
}
