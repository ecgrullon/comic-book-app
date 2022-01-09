import 'dart:convert';

CreditDetail creditDetailFromJson(String str) => CreditDetail.fromJson(json.decode(str));

class CreditDetail {
    CreditDetail({
        this.dateAdded,
        this.description,
        this.id,
        this.image,
        this.name,
    });

    final DateTime? dateAdded;
    final String? description;
    final int? id;
    final String? image;
    final String? name;

    CreditDetail copyWith({
        DateTime? dateAdded,
        String? description,
        int? id,
        String? image,
        String? name,
    }) => 
        CreditDetail(
            dateAdded: dateAdded ?? this.dateAdded,
            description: description ?? this.description,
            id: id ?? this.id,
            image: image ?? this.image,
            name: name ?? this.name,
        );

    factory CreditDetail.fromJson(Map<String, dynamic> json) => CreditDetail(
        dateAdded:json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        description: json["description"],
        id: json["id"],
        image: json["image"]["original_url"],
        name: json["name"],
    );
}
