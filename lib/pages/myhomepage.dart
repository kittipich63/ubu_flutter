import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuapp/pages/coursedetailpage.dart';
import 'package:ubuapp/widgets/app_icon_button.dart';
import '../mockup/data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> courses = [];

  void _addRandomCourse() {
    setState(() {
      courses.add(randomCourse());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // btn +
        floatingActionButton: FloatingActionButton(
          onPressed: _addRandomCourse,
          backgroundColor: Colors.white,
          splashColor: Colors.blue.withOpacity(0.35),
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
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
                        AppIconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/burger-menu-svgrepo-com.svg",
                            width: 24,
                            height: 24,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(width: 8), // Add spacing
                    Text(
                      "UBU APP", // Added text
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Spacer to split the items
                    const Spacer(),
                    // Avatar Profile
                    ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.asset(
                        "assets/icons/user.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Menu Right
                    AppIconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/menu-vertical-svgrepo-com.svg",
                        width: 24,
                        height: 24,
                      ),
                      onTap: () {},
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
                    SizedBox(height:15),
                    Row(
                      children: [
                        Text(
                          "No assignments are due or past due this week.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: courses.length,
                  itemBuilder: (ctx, index) {
                    final course = courses[index];
                    final courseid = ('${course[0]}');
                    final courseName = course[1];
                    final lecturer = course[2];
                    final backgroundImage = course[3];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0), 
                            child: Image.asset(
                              backgroundImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 130,
                            ),
                          ),
                          // btn menu point
                          Align(
                            alignment:
                                Alignment.centerRight, // Align to the right
                            child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.more_vert),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CourseDetailPage(
                                    course: course,
                                  ), // course
                                ));
                              },
                            ),
                          ),
                        Positioned(
                          top: 10, 
                          left: 10, 
                          right: 0, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              courseName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35, 
                          left: 10, 
                          right: 0, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              courseid,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10, 
                          left: 10, 
                          right: 0, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              lecturer,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}