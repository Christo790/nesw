import 'package:flutter/material.dart';
import 'package:nesw/constant.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

class Feed extends StatelessWidget {
  final bool isLoading;
  final String titleText;
  final String descriptionHtml;
  final String contentHtml;
  final String imageUrl;

  const Feed({
    super.key,
    this.isLoading = false,
    required this.titleText,
    required this.descriptionHtml,
    required this.contentHtml,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final unescape = HtmlUnescape();

    final decodedDescription = unescape.convert(descriptionHtml);
    final decodedContent = unescape.convert(contentHtml);

    return Scaffold(
      backgroundColor: const Color(0xff1F2121),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  Text(
                    titleText,
                    style: title,
                    textAlign: TextAlign.center,
                  ),

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
                    data: decodedDescription,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        color: Colors.white,
                        fontSize: FontSize(16),
                        fontFamily: paragrah.fontFamily,
                      ),
                    },
                  ),

                  const SizedBox(height: 12),

                  Html(
                    data: decodedContent,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        color: Colors.white,
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
