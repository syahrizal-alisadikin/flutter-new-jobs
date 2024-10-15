import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/category_model.dart';
import 'package:flutter_jobs/models/job_model.dart';
import 'package:flutter_jobs/providers/job_provider.dart';
import 'package:flutter_jobs/widgets/job_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailJob extends StatelessWidget {
  final CategoryModel category;

  const DetailJob(
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
                        child: Image.network(
                          category.imageUrl,
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
                            category.name,
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
                      FutureBuilder<List<JobModel>>(
                          future:
                              jobProvider.getJobsByCategories(category.name),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: snapshot.hasData
                                    ? snapshot.data!
                                        .map(
                                          (jobs) => JobList(jobs),
                                        )
                                        .toList()
                                    : [
                                        Text('No data available'),
                                      ],
                                // [
                                //   JobList(
                                //     text: "Front End Developer",
                                //     imageUrl: 'assets/instagram-icon.png',
                                //     perusahan: "INTAGRAM",
                                //   ),
                                // ],
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          }),
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
                      FutureBuilder<List<JobModel>>(
                          future: jobProvider.getJobs(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: snapshot.hasData
                                    ? snapshot.data!
                                        .map(
                                          (jobs) => JobList(
                                            jobs,
                                          ),
                                        )
                                        .toList()
                                    : [
                                        Text('No data available'),
                                      ],
                                // [
                                //   JobList(
                                //     text: "Front End Developer",
                                //     imageUrl: 'assets/instagram-icon.png',
                                //     perusahan: "INTAGRAM",
                                //   ),
                                // ],
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          }),
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
