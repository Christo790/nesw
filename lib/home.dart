import 'package:flutter/material.dart';
import 'package:nesw/constant.dart';
import 'package:http/http.dart' as http;
import 'package:nesw/feed.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List newsList = [];

  Future<void> mainfeed() async {
    const url = "https://withered-fog-192d.christosgeorge7.workers.dev";

    final response = await http.get(Uri.parse(url));
    final feed = RssFeed.parse(response.body);

    setState(() {
      newsList = feed.items ?? [];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    mainfeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1A),
      appBar: AppBar(
        toolbarHeight: 40,

        backgroundColor: Colors.transparent,
        title: Center(child: Text("NESW", style: barstyle)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                scrollDirection: Axis.vertical,
                controller: PageController(viewportFraction: 0.92),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final item = newsList[index];

                  final title = item.title ?? "";
                  final content = item.content?.value ?? "";
                  //contentHtml = item?.content?.value ?? "";

                  final description = item.description ?? "";
                  final imgUrl = item.media?.contents?.isNotEmpty == true
                      ? item.media!.contents!.first.url ?? ""
                      : "";

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Feed(
                            titleText: title,
                            imageUrl: imgUrl,
                            descriptionHtml: description,
                            contentHtml: content,
                          ),
                        ),
                      );
                    },
                    child: mainbox(
                      title: title,
                      subtitle: description,
                      imgurl: imgUrl,
                      color: const Color(0xff1F2121),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
