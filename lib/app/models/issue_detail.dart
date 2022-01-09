import 'dart:convert';
import 'credit.dart';

IssueDetail issueDetailFromJson(String str) => IssueDetail.fromJson(json.decode(str));

class IssueDetail {
    IssueDetail({
        this.characterCredits,
        this.conceptCredits,
        this.dateAdded,
        this.description,
        this.id,
        this.image,
        this.issueNumber,
        this.locationCredits,
        this.name,
        this.teamCredits,
    });

    final List<Credit>? characterCredits;
    final List<Credit>? conceptCredits;
    final DateTime? dateAdded;
    final String? description;
    final int? id;
    final String? image;
    final String? issueNumber;
    final List<Credit>? locationCredits;
    final String? name;
    final List<Credit>? teamCredits;

    IssueDetail copyWith({
        List<Credit>? characterCredits,
        List<Credit>? conceptCredits,
        DateTime? dateAdded,
        String? description,
        int? id,
        String? image,
        String? issueNumber,
        List<Credit>? locationCredits,
        String? name,
        List<Credit>? teamCredits,
    }) => 
        IssueDetail(
            characterCredits: characterCredits ?? this.characterCredits,
            conceptCredits: conceptCredits ?? this.conceptCredits,
            dateAdded: dateAdded ?? this.dateAdded,
            description: description ?? this.description,
            id: id ?? this.id,
            image: image ?? this.image,
            issueNumber: issueNumber ?? this.issueNumber,
            locationCredits: locationCredits ?? this.locationCredits,
            name: name ?? this.name,
            teamCredits: teamCredits ?? this.teamCredits,
        );

    factory IssueDetail.fromJson(Map<String, dynamic> json) => IssueDetail(
        characterCredits: List<Credit>.from(json["character_credits"].map((x) => Credit.fromJson(x))),
        conceptCredits: List<Credit>.from(json["concept_credits"].map((x) => Credit.fromJson(x))),
        dateAdded:json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
        description: json["description"],
        id: json["id"],
        image: json["image"]["original_url"],
        issueNumber: json["issue_number"],
        locationCredits: List<Credit>.from(json["location_credits"].map((x) => Credit.fromJson(x))),
        name: json["name"],
        teamCredits: List<Credit>.from(json["team_credits"].map((x) => Credit.fromJson(x))),
    );
}
