import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/job_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPages extends StatefulWidget {
  final JobModel job;
  const DetailPages(this.job);

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

    Widget detailItem(detail) {
      return Row(
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
          Text(detail),
        ],
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            isApplied ? successApply() : notApply(),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.network(widget.job.companyLogo,
                  width: 100, height: 100),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.job.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${widget.job.companyName} • ${widget.job.location}",
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
                    children: widget.job.about
                        .map((text) => detailItem(text))
                        .toList(),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.job.qualifications
                          .map((text) => detailItem(text))
                          .toList(),
                    ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.job.responsibilities
                          .map((text) => detailItem(text))
                          .toList(),
                    ),
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
