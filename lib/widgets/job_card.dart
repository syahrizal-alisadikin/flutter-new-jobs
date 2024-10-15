import 'package:flutter/material.dart';
import 'package:flutter_jobs/models/category_model.dart';
import 'package:flutter_jobs/pages/detail_job.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final CategoryModel category;
  JobCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailJob(
                    category,
                  )),
        );
      },
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              category.name,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageUrl),
          ),
        ),
      ),
    );
  }
}
