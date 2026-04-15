class ArticleModel {
  final List<Article> articles;

  ArticleModel({required this.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    final List<Article> temp = (json["articles"] as List)
        .map<Article>((item) => Article(
              title: item["title"] ?? "",
              author: item["author"] ?? "",
              description: item["description"] ?? "",
              urlToImage: item["urlToImage"] ?? "",
              publishedAt: item["publishedAt"] ?? "",
              content: item["content"] ?? "",
              name: item["source"]?["name"] ?? "",
            ))
        .toList();
    return ArticleModel(articles: temp);
  }
}

class Article {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String name;

  Article({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.name,
  });
}
