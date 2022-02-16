class BackpackItem {
  // BackpackItem({
  //   this.name,
  //   this.travel,
  //   this.id,
  // });
  BackpackItem({
    required this.name,
    required this.travel,
    required this.id,
  });

  String name;
  int travel;
  int id;

  factory BackpackItem.fromJson(Map<String, dynamic> json) => BackpackItem(
        name: json["name"],
        travel: json["travel"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "travel": travel,
        "id": id,
      };
}
