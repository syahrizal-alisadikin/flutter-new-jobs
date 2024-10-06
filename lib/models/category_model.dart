// class CategoryModel {
//   String id;
//   String name;
//   String imageUrl;
//   int createdAt = 0;
//   int updatedAt = 0;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? '';
//     name = json['name'] ?? '';
//     imageUrl = json['imageUrl'] ?? '';
//     createdAt =
//         json['createdAt'] != null ? int.parse(json['createdAt'].toString()) : 0;
//     updatedAt =
//         json['updatedAt'] != null ? int.parse(json['updatedAt'].toString()) : 0;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'imageUrl': imageUrl,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       // Tidak menyertakan password jika untuk keperluan umum
//     };
//   }
// }

class CategoryModel {
  String id = '';
  String name = '';
  String imageUrl = '';
  int createdAt = 0; // Nilai default diberikan di sini
  int updatedAt = 0; // Nilai default diberikan di sini

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    createdAt =
        json['createdAt'] != null ? int.parse(json['createdAt'].toString()) : 0;
    updatedAt =
        json['updatedAt'] != null ? int.parse(json['updatedAt'].toString()) : 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
