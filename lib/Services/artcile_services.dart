import 'package:dio/dio.dart';
import 'package:e_book_flutter_project/Models/article_model.dart';

class ArtcileServices {
  static Dio dio = Dio();
  static Future<ArticleModel> getarticles() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=43135694669d40b18690ac575e4e729d',
      );
      return ArticleModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load articles: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  static Future<ArticleModel> SearchBook({required String q}) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=43135694669d40b18690ac575e4e729d&q=$q",
      );
      return ArticleModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
