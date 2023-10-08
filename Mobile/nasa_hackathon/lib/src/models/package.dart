// ignore_for_file: public_member_api_docs, sort_constructors_first
class Package {
  final String id;
  final String name;
  final String? planetImage;
  final int price;
  final String distance;
  final String description;

  Package({
    required this.id,
    required this.name,
    this.planetImage,
    required this.price,
    required this.distance,
    required this.description,
  });
}
