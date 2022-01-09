class Credit {
  Credit({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;

  Credit copyWith({
    String? apiDetailUrl,
    int? id,
    String? name,
    String? siteDetailUrl,
  }) =>
      Credit(
        apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        id: id ?? this.id,
        name: name ?? this.name,
        siteDetailUrl: siteDetailUrl ?? this.siteDetailUrl,
      );

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );
}
