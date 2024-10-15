import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/category_model.dart';
import 'package:flutter_jobs/models/job_model.dart';
import 'package:flutter_jobs/providers/category_provider.dart';
import 'package:flutter_jobs/providers/job_provider.dart';
import 'package:flutter_jobs/providers/user_provider.dart';
import 'package:flutter_jobs/widgets/job_card.dart';
import 'package:flutter_jobs/widgets/job_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 24,
          right: 24,
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Malam,',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    userProvider.user?.name ?? "BELUM ADA NAMA",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/200/300?random=1'),
                radius: 30,
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              FutureBuilder<List<CategoryModel>>(
                future: categoryProvider.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.hasData
                            ? snapshot.data!
                                .map(
                                  (category) => JobCard(category),
                                )
                                .toList()
                            : [Text('No data available')],
                        // [
                        //   JobCard(
                        //     text: 'Flutter Developer',
                        //     imageUrl: 'assets/card_category.png',
                        //   ),

                        // ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              Text(
                "Jobs",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Container(
                child: FutureBuilder<List<JobModel>>(
                    future: jobProvider.getJobs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
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
              ),
            ],
          ),
        ),
      );
    }
    // Widget body(BuildContext context) {
    //   var categoryProvider =
    //       Provider.of<CategoryProvider>(context, listen: false);

    //   return Container(
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 24),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "Category",
    //             style: GoogleFonts.poppins(
    //                 fontSize: 18, fontWeight: FontWeight.w500),
    //           ),
    //           SizedBox(height: 16),

    //           // Mengambil dan menampilkan data dari API dengan FutureBuilder
    //           FutureBuilder<List<CategoryModel>>(
    //             future: categoryProvider.getCategories(),
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return Center(child: CircularProgressIndicator());
    //               } else if (snapshot.hasError) {
    //                 return Center(child: Text('Error: ${snapshot.error}'));
    //               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //                 return Center(child: Text("No categories available."));
    //               } else {
    //                 // Menampilkan data kategori dari API
    //                 List<CategoryModel> categories = snapshot.data!;

    //                 return SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Row(
    //                     children: categories.map((category) {
    //                       return Padding(
    //                         padding: const EdgeInsets.only(right: 16),
    //                         child: JobCard(
    //                           text: category.name,
    //                           imageUrl: category.imageUrl,
    //                         ),
    //                       );
    //                     }).toList(),
    //                   ),
    //                 );
    //               }
    //             },
    //           ),

    //           SizedBox(height: 24),
    //           Text(
    //             "Jobs",
    //             style: GoogleFonts.poppins(
    //                 fontSize: 18, fontWeight: FontWeight.w500),
    //           ),
    //           SizedBox(height: 16),
    //           JobList(
    //             text: "Front End Developer",
    //             imageUrl: 'assets/instagram-icon.png',
    //             perusahan: "INSTAGRAM",
    //           ),
    //           SizedBox(height: 20),
    //           JobList(
    //             text: "Back End Developer",
    //             imageUrl: 'assets/facebook-icon.png',
    //             perusahan: "FACEBOOK",
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: Colors.blueAccent.shade700,
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_1.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_2.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_3.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_4.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(
              height: 30,
            ),
            body()
          ],
        ),
      ),
    );
  }
}
