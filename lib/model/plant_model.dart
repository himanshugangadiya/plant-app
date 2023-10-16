class PlantModel {
  final String image;
  final String name;
  final double price;
  final String description;
  final String height;
  final String temparature;
  final String pot;
  const PlantModel(
    this.height,
    this.temparature,
    this.pot, {
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}
