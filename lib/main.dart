import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Article App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticlePage(),
    );
  }
}

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  Future<List<Article>> fetchArticles() async {
    final url = Uri.parse(
        'https://yahoo-finance15.p.rapidapi.com/api/v1/markets/news?tickers=AAPL%2CTSLA');
    final headers = {
      'X-RapidAPI-Key': '99dbf9f00fmshf99235d9556391ep105de4jsn4511d9788c28',
      'X-RapidAPI-Host': 'yahoo-finance15.p.rapidapi.com',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body)['body'];
      return jsonData.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final Uri _url =
                    Uri.parse(snapshot.data![index].link);
                    // Open the article link when the card is tapped
                    launchUrl(_url);
                  },
                  child: Card(
                    elevation: 8,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto', // Custom font
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                snapshot.data![index].pubDate,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.source,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                snapshot.data![index].source,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String link;
  final String pubDate;
  final String source;
  final String guid;

  Article({
    required this.title,
    required this.link,
    required this.pubDate,
    required this.source,
    required this.guid,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      link: json['link'],
      pubDate: json['pubDate'],
      source: json['source'],
      guid: json['guid'],
    );
  }
}

// launchUrl(Uri uri) async {
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     throw 'Could not launch ${uri.toString()}';
//   }
// }

