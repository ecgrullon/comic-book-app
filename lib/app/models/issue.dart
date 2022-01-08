import 'dart:convert';

Issue issueFromJson(String str) => Issue.fromJson(json.decode(str));

String issueToJson(Issue data) => json.encode(data.toJson());

class Issue {
    Issue({
        this.dateAdded,
        this.description,
        this.id,
        this.image,
        this.issueNumber,
        this.name,
    });

    final DateTime? dateAdded;
    final String? description;
    final int? id;
    final String? image;
    final String? issueNumber;
    final String? name;

    Issue copyWith({
        DateTime? dateAdded,
        String? description,
        int? id,
        String? image,
        String? issueNumber,
        String? name,
    }) => 
        Issue(
            dateAdded: dateAdded ?? this.dateAdded,
            description: description ?? this.description,
            id: id ?? this.id,
            image: image ?? this.image,
            issueNumber: issueNumber ?? this.issueNumber,
            name: name ?? this.name,
        );

    factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        
        dateAdded:json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        description: json["description"],
        id: json["id"],
        image: json["original_url"],
        issueNumber: json["issue_number"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "date_added": dateAdded == null ? null : dateAdded!.toIso8601String(),
        "description": description,
        "id": id,
        "image": image,
        "issue_number": issueNumber,
        "name": name,
    };
}