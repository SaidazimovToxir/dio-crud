class CategoryModel {
  final int id;
  final String name;
  final String image;
  String creationAt;
  String updatedAt;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      creationAt: map['creationAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }
}
