import 'dart:convert';

Issue issueFromJson(String str) => Issue.fromJson(json.decode(str));

class Issue {
    Issue({
        this.dateAdded,
        this.description,
        this.id,
        this.image,
        this.issueNumber,
        this.name,
        this.apiDetailUrl
    });

    final DateTime? dateAdded;
    final String? description;
    final int? id;
    final String? image;
    final String? issueNumber;
    final String? name;
    final String? apiDetailUrl;

    Issue copyWith({
        DateTime? dateAdded,
        String? description,
        int? id,
        String? image,
        String? issueNumber,
        String? name,
        String? apiDetailUrl
    }) => 
        Issue(
            dateAdded: dateAdded ?? this.dateAdded,
            description: description ?? this.description,
            id: id ?? this.id,
            image: image ?? this.image,
            issueNumber: issueNumber ?? this.issueNumber,
            name: name ?? this.name,
            apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        );

    factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        dateAdded:json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        description: json["description"],
        id: json["id"],
        image: json["image"]["original_url"],
        issueNumber: json["issue_number"],
        name: json["name"] ?? json["volume"]["name"],
        apiDetailUrl: json["api_detail_url"]
    );
}