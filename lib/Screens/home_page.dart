import 'package:e_book_flutter_project/Provider/articel_provider.dart';
import 'package:e_book_flutter_project/Screens/details_screen.dart';
import 'package:e_book_flutter_project/Screens/search_screen.dart';
import 'package:e_book_flutter_project/Widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});  

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.85);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Consumer<ArticleProvider>(
          builder: (context, provider, child) {
            if (provider.articlemodel == null) {
              provider.getarticles();
              return const Center(child: CircularProgressIndicator());
            }
            var articles = provider.articlemodel!.articles;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, size: 30),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                          }, icon: Icon(Icons.search, color: Colors.grey.shade700)),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.notifications,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Popular Articles",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      var article = articles[index];
                      return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double value = 1;
                          if (controller.position.haveDimensions) {
                            value = controller.page! - index;
                            value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                          }

                          return Transform.scale(
                            scale: value,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(article.urlToImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: const [
                      CustomElevatedButton(
                        name: 'New',
                        background: Colors.orange,
                        foreground: Colors.white,
                      ),
                      CustomElevatedButton(
                        name: 'Popular',
                        background: Colors.red,
                        foreground: Colors.white,
                      ),
                      CustomElevatedButton(
                        name: 'Trending',
                        background: Colors.blue,
                        foreground: Colors.white,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // 📰 List
                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      var article = articles[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(article: article),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  article.urlToImage,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey,
                                      child: const Icon(Icons.broken_image),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      article.author,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
