class Diet {
  final String id;
  final String name;
  final String age;
  final String weight;
  final String breakfast;
  final String lunch;
  final String dinner;

  Diet(this.id, this.name, this.age, this.weight, this.breakfast,
      this.lunch, this.dinner);

  Diet.fromJson(Map<String, dynamic> json, this.id, this.name, this.age,
      this.weight, this.breakfast, this.lunch, this.dinner);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "weight": weight,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner": dinner,
      };
}
