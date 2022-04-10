class KitchenTips {
  final String id;
  final String name;
  final String description;

  KitchenTips(this.id, this.name, this.description);

  KitchenTips.fromJson(
      Map<String, dynamic> json, this.id,this.name, this.description);

  Map<String, dynamic> toJson() => {
    "tipNo": id,
    "name": name,
    "description": description,
  };
}
