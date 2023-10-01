import 'package:flutter/material.dart';
import 'package:ubuapp/pages/login.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() {
    return _StateFirstPage();
  }
}

class _StateFirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 2,125,253),
                  Color.fromARGB(255, 4,43,89),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'images/sci.png',
                      width: 130,
                    ),
                    const Text(
                      'UBU Classroom',
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
