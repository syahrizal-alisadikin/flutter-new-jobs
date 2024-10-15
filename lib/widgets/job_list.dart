import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/job_model.dart';
import 'package:flutter_jobs/pages/detail_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class JobList extends StatelessWidget {
  final JobModel job;
  const JobList(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPages(job)),
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
          Image.network(
            job.companyLogo,
            height: 40,
            width: 40,
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text(
                  job.companyName,
                  style: GoogleFonts.poppins(
                      fontSize: 15, color: Colors.blueGrey.shade600),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
