import 'package:flutter/material.dart';
import 'package:flutter_jobs/pages/detail_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class JobList extends StatelessWidget {
  final String text;
  final String perusahan;
  final String imageUrl;
  const JobList(
      {required this.text, required this.imageUrl, required this.perusahan});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPages()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: 80,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage('assets/instagram-icon.png'),
          //   )),
          // ),
          // SizedBox(width: 16),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Front End Developer",
          //       style: GoogleFonts.poppins(
          //           fontSize: 17, fontWeight: FontWeight.w600),
          //     ),
          //     Text(
          //       "INTAGRAM",
          //       style: GoogleFonts.poppins(
          //           fontSize: 15, color: Colors.blueGrey.shade600),
          //     ),
          //   ],
          // )
          Image.asset(
            imageUrl,
            height: 40,
            width: 40,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Text(
                perusahan,
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colors.blueGrey.shade600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
