class Beverages {
  final String id;
  final String name;
  final String description;
  final String ingredients;

  const Beverages(this.id, this.name, this.description, this.ingredients);

 Beverages.fromJson(
      Map<String, dynamic> json, this.id, this.name, this.description, this.ingredients);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "ingredients": ingredients
  };
}