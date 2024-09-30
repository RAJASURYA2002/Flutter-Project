import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/professor.jpg'),
              ),
              const Text("Rajasurya",
              style: TextStyle(
                fontFamily: 'ShadowsIntoLight',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              Text("FLUTTER DEVELOPER",
              style: TextStyle(
                fontFamily:'Poppins',
                fontSize: 18.0,
                letterSpacing: 2.5,
                color: Colors.teal[100],
                fontWeight: FontWeight.bold 
              ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal.shade100),
              ),
              Card(
                color: Colors.white,
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:ListTile(
                    leading: Icon(Icons.phone,
                      color: Colors.teal,
                      ),
                      title: Text("+91 9840864118",
                      style: TextStyle(
                        fontFamily:'Poppins',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold 
                      ),
                      ),
                  ), 
                ),
              ),
              Card(
              color: Colors.white,
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:ListTile(
                    leading: Icon(Icons.email,
                      color: Colors.teal,
                      ),
                      title: Text("rajasurya20024@gmail.com",
                      style: TextStyle(
                        fontFamily:'Poppins',
                        fontSize: 17.2,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold 
                      ),
                      ),
                  ), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
