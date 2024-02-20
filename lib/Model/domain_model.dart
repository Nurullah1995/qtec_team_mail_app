

class DomainModel {
  String? id;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  String ?createdAt;
  String? updatedAt;

  DomainModel({
     this.id,
    this.domain,
    this.isActive,
     this.isPrivate,
    this.createdAt,
     this.updatedAt,
  });

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      id: json['id'],
      domain: json['domain'],
      isActive: json['isActive'],
      isPrivate: json['isPrivate'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}