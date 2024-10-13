import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Method to determine the letter grade based on the numerical grade
  String gradeState(double grade) {
    if (grade >= 90) {
      return 'A';
    } else if (grade >= 80 && grade < 90) {
      return 'B';
    } else if (grade >= 70 && grade < 80) {
      return 'C';
    } else if (grade >= 60 && grade < 70) {
      return 'D';
    } else {
      return "F"; // Default case for grades below 60
    }
  }

  final gradeController =
      TextEditingController(); // Controller for the TextField input
  String result = ""; // Variable to hold the result of the grade calculation

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Grade Calculator"), // Title of the app
            backgroundColor: Colors.redAccent[200],
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    controller: gradeController, // Assign the controller
                    keyboardType: TextInputType.number, // Numeric input
                    decoration: const InputDecoration(
                      hintText: "Grade",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                if (result.isNotEmpty)
                  Container(height: 30), // Space if there is a result
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.redAccent[200]),
                    ),
                    label: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (gradeController.text.isNotEmpty) {
                        // Check if the input is not empty
                        var grade = double.parse(
                            gradeController.text); // Parse the input to double
                        result = gradeState(grade); // Get the letter grade

                        setState(() {});
                      } else {
                        // Show a snackbar if the input is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please write your grade.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Text(
                  result, // Display the result
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
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
