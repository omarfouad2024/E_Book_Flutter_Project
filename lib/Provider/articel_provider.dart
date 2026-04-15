import 'package:e_book_flutter_project/Models/article_model.dart';
import 'package:e_book_flutter_project/Services/artcile_services.dart';
import 'package:flutter/material.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleModel? articlemodel;
  ArticleModel? Filter;
  Future<void> getarticles() async {
    try {
      articlemodel = await ArtcileServices.getarticles();
      notifyListeners();
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  Future<void> SearchBook(String books) async {
    Filter = await ArtcileServices.SearchBook(q: books);
    notifyListeners();
  }
}
