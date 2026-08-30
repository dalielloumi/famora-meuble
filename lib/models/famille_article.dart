import 'package:freezed_annotation/freezed_annotation.dart';

part 'famille_article.freezed.dart';
part 'famille_article.g.dart';

@freezed
abstract class FamilleArticle with _$FamilleArticle {
  const factory FamilleArticle({
    String? id,
    required String code,
    required String libelle,
    @JsonKey(name: 'parent_id') String? parentId,
  }) = _FamilleArticle;

  factory FamilleArticle.fromJson(Map<String, dynamic> json) => _$FamilleArticleFromJson(json);
}
