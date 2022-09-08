import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  int? page;
  List<SearchResult> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchResponse({
    this.page,
    this.results = const [],
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}


// Initialy this ws generated as different file. But i copied to here, so no i have this one file and correspnding one part file

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResult({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
