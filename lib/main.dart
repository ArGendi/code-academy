import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.red,
        backgroundColor: isDarkMode ? Colors.black : Colors.green,
        title: Text('Our app'),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isDarkMode = !isDarkMode;
              });
            }, 
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              child: ProfileCircle(width: 120, height: 120,),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: (){
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              child: ProfileCircle(width: 120, height: 120,),
            ),
            DynamicContainer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 0
              ),
              onPressed: (){
                print("I'm in elevated");
              }, 
              child: Text("Elevated"),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: BorderSide(width: 2, color: Colors.green)
              ),
              onPressed: (){}, 
              child: Text("Outlined"),
            ),
          ],
        ),
      ),
    ),
  );
  }
}

class ProfileCircle extends StatelessWidget {
  final double? width;
  final double? height;
  const ProfileCircle({super.key, this.width = 100, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.yellow,
      ),
      child: Center(child: Icon(Icons.person_2)),
    );
  }
}


class DynamicContainer extends StatefulWidget {
  const DynamicContainer({super.key});

  @override
  State<DynamicContainer> createState() => _DynamicContainerState();
}

class _DynamicContainerState extends State<DynamicContainer> {
  double width = 100;
  bool colorChanged = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      color: colorChanged ? Colors.black : Colors.grey,
      child: TextButton(
        child: Text("Click me"),
        onPressed: (){
          setState(() {
            width = 200;
            colorChanged = !colorChanged;
          });
        },
      ),
    );
  }
}