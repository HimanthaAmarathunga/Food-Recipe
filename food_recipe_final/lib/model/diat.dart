class Diet {
  final String dietId;
  final String name;
  final String age;
  final String weight;
  final String breakfast;
  final String lunch;
  final String dinner;

  Diet(this.dietId, this.name, this.age, this.weight, this.breakfast,
      this.lunch, this.dinner);

  Diet.fromJson(Map<String, dynamic> json, this.dietId, this.name, this.age,
      this.weight, this.breakfast, this.lunch, this.dinner);

  Map<String, dynamic> toJson() => {
        "dietId": dietId,
        "name": name,
        "age": age,
        "weight": weight,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner": dinner,
      };
}
