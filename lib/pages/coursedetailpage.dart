import 'package:flutter/material.dart';
import 'package:ubuapp/pages/myhomepage.dart';

class CourseDetailPage extends StatefulWidget {
  final dynamic course;

  CourseDetailPage({super.key, this.course});

  @override
  State<CourseDetailPage> createState() {
    return _StateCourseDetailPage();
  }
}

class _StateCourseDetailPage extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    // Burger Menu Icon (left)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeView(), // course
                            ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Container(
                // Wrap the rows in a container
                padding: EdgeInsets.all(14), // Add padding if needed
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black), // Add a border if needed
                  borderRadius:
                      BorderRadius.circular(8), // Add border radius if needed
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "This week",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(360),
                          splashColor:
                          Colors.lightBlue.withOpacity(0.25),
                          highlightColor:
                              Colors.lightBlueAccent.withOpacity(0.4),
                          onTap: () {
                            // Add your action here
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "View to-do list",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
