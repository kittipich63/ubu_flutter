import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuapp/ui/widgets/app_icon_button.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UBU APP',
      home: const HomeView() 
    );
  }
}


const COURSES = [
  [1411101, 'Thai Language for Communication',],
  [1421102, 'Foundation English I',],
  [1421103, 'Foundation English II',],
  [1421222, 'English for Science and Technology',],
  [1421216, 'English for Travel',],
  [1421217, 'English through Media',],
  [1421218, 'English for Career Preparation',],
  [1431111, 'Ethics and Reasoning',],
  [1441100, 'Man and Society',],
  [1502100, 'Age-appropriated Health Care',],
  [1703110, 'Finance Skills in Daily Life',],
  [1432100, 'Man and Civilization',],
  [1435100, 'Music for Life',],
  [1446101, 'Arts of Living',],
  [1449100, 'Man and Tourism',],
  [1441103, 'Social Innovation',],
  [2100101, 'Law and Modern Society',],
  [1439100, 'Exercise for Health',],
  [1503100, 'Drugs and Herbs in Daily Life',],
  [1507100, 'Society and Health',],
  [1141001, 'Statistics and Quantitative Analysis',],
  [1141002, 'Discrete Mathematics',],
  [1141003, 'Numerical Methods',],
  [1145000, 'Introduction to Computer and Computer Organization',],
  [1145001, 'Introduction to Programming',],
  [1145002, 'Data Structures and Algorithms',],
  [1145003, 'System Analysis and Design',],
  [1145004, 'Database System',],
  [1145005, 'Web Programming',],
  [1145006, 'Object-oriented Programming',],
  [1145007, 'Mobile Application Programming',],
  [1145008, 'Data Collection and Data Visualization',],
  [1145009, 'Cloud Computing',],
  [1145010, 'Machine Learning',],
  [1146002, 'User Experience and User Interface Design',],
  [1146003, 'Data Communication and Inter-networking',],
  [1145100, 'Data Science Toolbox',],
  [1145101, 'Exploratory Data Analytics',],
  [1145102, 'Software Engineering',],
  [1145103, 'Software Project Management',],
  [1145104, 'Data Science and Software Innovation Project',],
  [1145200, 'Data Warehousing',],
  [1145201, 'Information Retrieval',],
  [1145202, 'Natural Language Processing',],
  [1145203, 'Decision Support Systems',],
  [1145204, 'Artificial Intelligence',],
  [1145205, 'Data Mining',],
  [1145206, 'Image Analytics',],
  [1145207, 'Pattern Recognition',],
  [1145208, 'Deep Learning',],
  [1145209, 'Selected Topics in Data Science',],
  [1145210, 'Big Data Analytics',],
  [1145211, 'Marketing Data Analytics',],
  [1145212, 'Software Design and Pattern',],
  [1145213, 'Software Testing and Quality Assurance',],
  [1145214, 'Software Solutions for Entrepreneurs',],
  [1145215, 'Requirements Engineering',],
  [1145216, 'Software Innovation Development and Application',],
  [1145217, 'Software Metrics',],
  [1145218, 'Selected Topics in Software Innovation',],
  [1145219, 'C# Programming',],
  [1145220, 'Java Programming',],
  [1145221, 'Python Programming',],
  [1145222, 'Selected Topics in Programming Language',],
  [1146212, 'Internet of Things',],
  [1145300, 'Co-operative Education',],
];

const LECTURERS = [
  'Alain Jean',
  'Chayaporn Kaensar',
  'Kriengsak Treeprapin',
  'Phaichayon Kongchai',
  'Supawadee Hiranpongsin',
  'Tossaporn Juchim',
  'Wasana Ngaogate',
  'Wayo Puyati',
  'Wichit Sombat',
];

const List<String> backgroundImages = [
  "assets/images/Chemistry.jpg",
  "assets/images/Honors.jpg",
  "assets/images/img_bookclub.jpg",
  "assets/images/img_learnlanguage.jpg",
  "assets/images/img_reachout.jpg",
  "assets/images/img_read.jpg",
]; 

var random = Random();

List<dynamic> randomCourse() {
  List<dynamic> course = [];
  course.addAll(COURSES[random.nextInt(COURSES.length)]);
  course.add(LECTURERS[random.nextInt(LECTURERS.length)]);
  course.add(backgroundImages[random.nextInt(backgroundImages.length)]);
  return course;
}


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
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
                        Positioned(
                          top: 15,
                          right: 5,
                            child: SvgPicture.asset(
                              "assets/icons/menu-vertical-svgrepo-com.svg",
                              width: 25, 
                              height: 25,
                              color:Colors.white, 
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


