import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final title = GoogleFonts.manjari(
  color: Color(0xff31B8C6),
  fontSize: 25,
  fontWeight: FontWeight.w700,
);
final paragrah = GoogleFonts.manjari(
  color: Colors.white,

  fontSize: 18,
  fontWeight: FontWeight.w500,
);

const backarrow = Text("");
final barstyle = GoogleFonts.permanentMarker(
  color: Colors.white,
  fontSize: 22,

  fontWeight: FontWeight.w500,
);
final htitle = GoogleFonts.manjari(
  color: Color(0xff31B8C6),
  fontSize: 25,
  fontWeight: FontWeight.w800,
);
final stitle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

class mainbox extends StatelessWidget {
  String title;
  Color color;
  String imgurl;
  String subtitle;

  mainbox({
    super.key,
    required this.title,
    required this.imgurl,
    required this.color,

    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: imgurl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Transform.scale(
                      scale: 1.05,
                      child: Image.network(
                        imgurl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey.shade300,
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(Icons.image_not_supported),
                  ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: htitle,
                ),
                SizedBox(height: 20),

                Text(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  subtitle,
                  style: stitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const height = SizedBox(height: 20);
