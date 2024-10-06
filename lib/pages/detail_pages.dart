import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({super.key});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  bool isApplied = false;
  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Center(
        child: Column(
          children: [
            Container(
              height: 45,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff4141A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  setState(() {
                    isApplied = !isApplied;
                  });
                },
                child: Text(
                  "Apply Job",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Message Recruiter"),
            ),
          ],
        ),
      );
    }

    Widget cancelApply() {
      return Center(
        child: Container(
          height: 45,
          width: 200,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color(0xffFD4F56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: () {
              setState(() {
                isApplied = !isApplied;
              });
            },
            child: Text(
              "Cancel Job",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    Widget successApply() {
      return Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Text(
          "Berhasil Apply",
          style: GoogleFonts.poppins(
              fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500),
        ),
      ));
    }

    Widget notApply() {
      return Center(
          child: Text(
        "",
        style: GoogleFonts.poppins(
            fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500),
      ));
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            isApplied ? successApply() : notApply(),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.asset('assets/instagram-icon.png',
                  width: 100, height: 100),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Front End Developer',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Instagram, Inc • Jakarta",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About The Job",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Fulltime Onsite")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Start at Rp 8000.000")
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Qualifications",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Able to use Microsoft Office and  \nGoogle based service.")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Candidate must possess at least a Bachelor's Degree.")
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Able to use Microsoft Office and  \nGoogle based service.")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Responsibilities",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Able to use Microsoft Office and  \nGoogle based service.")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Candidate must possess at least a Bachelor's Degree.")
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          // Icon(Icons.room_rounded),
                          Image.asset(
                            'assets/dot.png',
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              "Able to use Microsoft Office and  \nGoogle based service.")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  isApplied ? cancelApply() : applyButton()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
