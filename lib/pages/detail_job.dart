import 'package:flutter/material.dart';
import 'package:flutter_jobs/widgets/job_list.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailJob extends StatelessWidget {
  final String titleJob;
  final String imageUrl;

  const DetailJob({
    required this.imageUrl,
    required this.titleJob,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 230.0, left: 36),
                    //   child: Text(
                    //     "Web Developer",
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230.0, left: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleJob,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '12,309 available',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Big Company",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          JobList(
                            text: "Front End Developer",
                            imageUrl: 'assets/instagram-icon.png',
                            perusahan: "INTAGRAM",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Back end Developer",
                            imageUrl: 'assets/facebook-icon.png',
                            perusahan: "FACEBOOK",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "New Startup",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          JobList(
                            text: "Front End Developer",
                            imageUrl: 'assets/instagram-icon.png',
                            perusahan: "INTAGRAM",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Back end Developer",
                            imageUrl: 'assets/facebook-icon.png',
                            perusahan: "FACEBOOK",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Front End Developer",
                            imageUrl: 'assets/instagram-icon.png',
                            perusahan: "INTAGRAM",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Back end Developer",
                            imageUrl: 'assets/facebook-icon.png',
                            perusahan: "FACEBOOK",
                          ),
                          JobList(
                            text: "Front End Developer",
                            imageUrl: 'assets/instagram-icon.png',
                            perusahan: "INTAGRAM",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Back end Developer",
                            imageUrl: 'assets/facebook-icon.png',
                            perusahan: "FACEBOOK",
                          ),
                          JobList(
                            text: "Front End Developer",
                            imageUrl: 'assets/instagram-icon.png',
                            perusahan: "INTAGRAM",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          JobList(
                            text: "Back end Developer",
                            imageUrl: 'assets/facebook-icon.png',
                            perusahan: "FACEBOOK",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
