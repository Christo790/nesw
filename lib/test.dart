import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final title = GoogleFonts.manjari(fontSize: 25, fontWeight: FontWeight.w700);
final paragrah = GoogleFonts.manjari(fontSize: 18, fontWeight: FontWeight.w500);

const backarrow = Text("");
final barstyle = GoogleFonts.manjari(
  color: Colors.white,
  fontSize: 22,

  fontWeight: FontWeight.w800,
);
final htitle = GoogleFonts.manjari(
  color: Color(0xff31B8C6),
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
final stitle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class mainbox extends StatelessWidget {
  String title;
  Color color;
  String subtitle;

  mainbox({
    super.key,
    required this.title,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: PageController(viewportFraction: 0.92),
      children: [
        mainbox(
          title: "സംസ്ഥാനസർക്കാരിന്റെ പ്രവർത്തനങ്ങളിൽ ജാഗ്രതക്കുറവ്",
          color: Color(0xff1F2121),
          subtitle:
              "കണ്ണൂർ : അടുത്തകാലങ്ങളിൽ സംസ്ഥാനസർക്കാരിന്റെ പ്രവർത്തനങ്ങളിൽ ജാഗ്രതക്കുറവുണ്ടാകുന്നുണ്ടെന്ന് സിപിഎം കണ്ണൂർ ജില്ലാ കമ്മിറ്റി യോഗത്തിൽ വിമർശം. തദ്ദേശ തി... ",
        ),
        mainbox(
          subtitle:
              "കണ്ണൂർ : അടുത്തകാലങ്ങളിൽ സംസ്ഥാനസർക്കാരിന്റെ പ്രവർത്തനങ്ങളിൽ ജാഗ്രതക്കുറവുണ്ടാകുന്നുണ്ടെന്ന് സിപിഎം കണ്ണൂർ ജില്ലാ കമ്മിറ്റി യോഗത്തിൽ വിമർശം. തദ്ദേശ തി... ",
          title: "കണ്ണൂർ : അടുത്തകാലങ്ങളിൽ സംസ്ഥാനസർക്കാരി",
          color: Color(0xff532633),
        ),
      ],
    );
  }
}

const height = SizedBox(height: 20);
