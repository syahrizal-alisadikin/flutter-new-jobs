class JobModel {
  String id = '';
  String name = '';
  String category = '';
  String companyName = '';
  String companyLogo = '';
  String location = '';
  List about = [];
  List qualifications = [];
  List responsibilities = [];
  int createdAt = 0; // Nilai default diberikan di sini
  int updatedAt = 0; // Nilai default diberikan di sini

  JobModel({
    required this.id,
    required this.name,
    required this.category,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    required this.about,
    required this.qualifications,
    required this.responsibilities,
    required this.createdAt,
    required this.updatedAt,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    category = json['category'] ?? '';
    companyName = json['companyName'] ?? '';
    companyLogo = json['companyLogo'] ?? '';
    location = json['location'] ?? '';
    about = json['about'] ?? '';
    qualifications = json['qualifications'] ?? '';
    responsibilities = json['responsibilities'] ?? '';
    createdAt =
        json['createdAt'] != null ? int.parse(json['createdAt'].toString()) : 0;
    updatedAt =
        json['updatedAt'] != null ? int.parse(json['updatedAt'].toString()) : 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'about': about,
      'qualifications': qualifications,
      'responsibilities': responsibilities,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
