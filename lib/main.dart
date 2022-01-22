import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'password_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment 10 Password Manager', textAlign: TextAlign.center),
        backgroundColor: Colors.teal[800],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/squad.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Type Pin (4 digits)',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: myController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.teal[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text('Type Key (Case Sensitive)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: myController2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.teal[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              //Expanded(
                //  flex: 1,
                 // child: Image.asset('assets/squad.jpg')
              //),
              //SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        backgroundColor: Colors.teal[800],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // call on password calculator function
                content: Text(calculatePassword(myController.text, myController2.text)),
                actions: [
                  TextButton(onPressed: (){
                      Clipboard.setData(ClipboardData(text: calculatePassword(
                          myController.text, myController2.text)));
                  }, child: Text('Copy to clipboard')),
                ],
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.done),
      ),
    );
  }
}