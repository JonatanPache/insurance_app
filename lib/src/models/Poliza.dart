class Poliza {
  int id;
  String name;

  Poliza({
    this.id,
    this.name
  });

  factory Poliza.fromJson(Map<String, dynamic> json) {
    return Poliza(id: json['id'], name: json['name']);
  }
}