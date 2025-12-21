import 'package:flutter/material.dart';
import 'package:nesw/constant.dart';
import 'package:flutter_html/flutter_html.dart';

class Feed extends StatelessWidget {

  bool isLoading = false;

  String titleText;

  String descriptionHtml;

  String contentHtml;

  String imageUrl;

   Feed({
    super.key,
    required this.titleText,
    required this.descriptionHtml,
    required this.contentHtml,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F2121),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText, style: title, textAlign: TextAlign.center),
                  const SizedBox(height: 20),

                  if (imageUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 200,
                          color: Colors.grey.shade300,
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  Html(
                    data: descriptionHtml,
                    style: {
                      "body": Style(
                        color: Colors.white,
                        fontSize: FontSize(16),
                        fontFamily: paragrah.fontFamily,
                      ),
                    },
                  ),

                  const SizedBox(height: 10),

                  Html(
                    data: contentHtml,
                    style: {
                      "body": Style(
                        color: Colors.white,
                        textAlign: TextAlign.start,
                        fontSize: FontSize(16),
                        lineHeight: LineHeight(1.6),
                        fontFamily: paragrah.fontFamily,
                      ),
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
