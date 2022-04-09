class KitchenTips {
  final String tipNo;
  final String name;
  final String description;

  KitchenTips(this.tipNo, this.name, this.description);

  KitchenTips.fromJson(
      Map<String, dynamic> json, this.tipNo,this.name, this.description);

  Map<String, dynamic> toJson() => {
    "tipNo": tipNo,
    "name": name,
    "description": description,
  };
}
