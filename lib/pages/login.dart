import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ubuapp/pages/myhomepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String? resultMessage; // Added to store the authentication result message

  final pb = PocketBase('http://127.0.0.1:8090');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 2, 125, 253),
                  Color.fromARGB(255, 5, 83, 177),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Welcome To\nUBU Classroom',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                          border: Border.all(
                            color: Color.fromARGB(255, 2, 125, 253),
                            width: 2.0, // Border width
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                            hintText: 'Gmail',
                            labelText: 'Gmail',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 4, 43, 89),
                            ),
                            border: InputBorder.none, // Remove the default underline
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 4, 43, 89),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // You can add more email validation logic here if needed.
                            return null; // Return null to indicate no error.
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                          border: Border.all(
                            color: Color.fromARGB(255, 2, 125, 253),
                            width: 2.0, // Border width
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 4, 43, 89),
                            ),
                            border: InputBorder.none, // Remove the default underline
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Color.fromARGB(255, 4, 43, 89),
                            ),
                          ),
                          obscureText: true, // Hide the password
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more password validation logic here if needed.
                            return null; // Return null to indicate no error.
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 70),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 2, 125, 253),
                              Color.fromARGB(255, 5, 83, 177),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print('Email: $_email');
                              print('Password: $_password');

                              // Authenticate using PocketBase

                              try {
                                final authData = await pb.admins.authWithPassword(_email, _password);

                                // Check if authentication was successful
                                if (pb.authStore.isValid) {
                                  // Authentication successful
                                  print('Authentication successful');
                                  //print('Token: ${pb.authStore.token}');
                                  print('User ID: ${pb.authStore.model.id}');

                                  // Navigate to the HomeView on successful login
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ));

                                  // Set the resultMessage to 'Authentication successful'
                                  setState(() {
                                    resultMessage = 'Authentication successful';
                                  });
                                } else {
                                  // Authentication failed
                                  print('Authentication failed');

                                  // Set the resultMessage to 'Authentication failed'
                                  setState(() {
                                    resultMessage = 'Authentication failed';
                                  });
                                }
                              } catch (e) {
                                // Handle any authentication errors
                                print('Authentication error: $e');

                                // Set the resultMessage to the error message
                                setState(() {
                                  resultMessage = 'Authentication error';
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent, // Set the button's background color to transparent
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Add borderRadius here
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        resultMessage ?? '', // Use resultMessage and provide a default value
                        style: TextStyle(
                          color: resultMessage == 'Authentication successful'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Positioned(
                          bottom: 180,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomeView()));
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 4, 43, 89),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SKIP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
