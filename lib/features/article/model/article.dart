import 'package:articles_app/features/article/model/author.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.readablePublishDate,
    required this.url,
    required this.commentsCount,
    required this.publishedTimestamp,
    required this.positiveReactionsCount,
    this.coverImage,
    required this.readingTimeMinutes,
    required this.tags,
    this.bodyHtml,
    this.bodyMarkdown,
    this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      readablePublishDate: json['readable_publish_date'] as String,
      url: json['url'] as String,
      commentsCount: json['comments_count'] as int,
      publishedTimestamp: json['published_timestamp'] as String,
      positiveReactionsCount: json['positive_reactions_count'] as int,
      coverImage: json['cover_image'] as String?,
      readingTimeMinutes: json['reading_time_minutes'] as int,
      tags: List<String>.from(
        (json['tag_list'] is String
                ? json['tags'] as List<String>
                : json['tag_list'] as List<String>)
            .map((String x) => x) as List<String>,
      ),
      bodyHtml: json['body_html'] as String?,
      bodyMarkdown: json['body_markdown'] as String?,
      author: json['user'] == null
          ? null
          : Author.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final int id;
  final String title;
  final String description;
  final String readablePublishDate;
  final String url;
  final int commentsCount;
  final int positiveReactionsCount;
  final String publishedTimestamp;
  final String? coverImage;
  final int readingTimeMinutes;
  final List<String> tags;
  final String? bodyHtml;
  final String? bodyMarkdown;
  final Author? author;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        readablePublishDate,
        url,
        commentsCount,
        positiveReactionsCount,
        publishedTimestamp,
        coverImage,
        readingTimeMinutes,
        tags,
        bodyHtml,
        bodyMarkdown,
        author,
      ];
}
