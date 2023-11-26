import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  int x = 0;
  File? imageFile;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> names = ["Ahmed", "mohamed", "omar", "Abdelrahman", "Abdallah", "Mo Salah"];

  void getImageFromCamera() async{
    ImagePicker picker = ImagePicker();
    XFile? xfile = await picker.pickImage(source: ImageSource.camera);
    if(xfile != null){
      setState(() {
        imageFile = File(xfile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      key: scaffoldKey,
      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text("Abdelrahman"), 
                accountEmail: Text("abdelrahman@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg?crop=0.668xw:1.00xh;0.184xw,0&resize=640:*'),
                ),
              ),
              ListTile(
                onTap: (){},
                title: Text("Home"),
                leading: Icon(Icons.home),
                //subtitle: Text("this is home page"),
                //trailing: Icon(Icons.search),
              ),
              ListTile(
                onTap: (){},
                title: Text("Men section"),
                leading: Icon(Icons.home),
                //subtitle: Text("this is home page"),
                //trailing: Icon(Icons.search),
              ),
              ListTile(
                onTap: (){},
                title: Text("Admin section"),
                leading: Icon(Icons.home),
                //subtitle: Text("this is home page"),
                //trailing: Icon(Icons.search),
              ),
              Spacer(),
              ListTile(
                onTap: (){},
                title: const Text("Log out", style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.exit_to_app, color: Colors.red,),
                //subtitle: Text("this is home page"),
                //trailing: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   foregroundColor: Colors.white,
      //   backgroundColor: isDarkMode ? Colors.black : Colors.green,
      //   title: Text('Our app'),
      //   // leading: Icon(Icons.menu),
      //   actions: [
      //     IconButton(
      //       onPressed: (){
      //         setState(() {
      //           isDarkMode = !isDarkMode;
      //         });
      //       }, 
      //       icon: Icon(Icons.dark_mode),
      //     ),
      //   ],
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       CircleAvatar(
      //         radius: 60,
      //         backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
      //         child: imageFile == null ? IconButton(
      //         icon: Icon(Icons.camera_alt),
      //           onPressed: (){
      //             getImageFromCamera();
      //           },
      //         ) : null,
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.menu),
      //         onPressed: (){
      //           scaffoldKey.currentState!.openDrawer();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: ListView.separated(
      //       itemCount: names.length,
      //       itemBuilder: (context, i){
      //         return Container(
      //           height: 150,
      //           color: Colors.green,
      //           child: Center(child: Text(names[i])),
      //         );
      //       }, 
      //       separatorBuilder: (BuildContext context, int index) { 
      //         return SizedBox(height: 10,);
      //        },
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: screenSize.width,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text("press me"),
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

//  GestureDetector(
//               onTap: (){
//                 setState(() {
//                   isDarkMode = !isDarkMode;
//                 });
//               },
//               child: ProfileCircle(width: 120, height: 120,),
//             ),
//             InkWell(
//               borderRadius: BorderRadius.circular(100),
//               onTap: (){
//                 setState(() {
//                   isDarkMode = !isDarkMode;
//                 });
//               },
//               child: ProfileCircle(width: 120, height: 120,),
//             ),
//             DynamicContainer(),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 elevation: 0
//               ),
//               onPressed: (){
//                 print("I'm in elevated");
//               }, 
//               child: Text("Elevated"),
//             ),
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: Colors.red,
//                 side: BorderSide(width: 2, color: Colors.green)
//               ),
//               onPressed: (){}, 
//               child: Text("Outlined"),
//             ),



// Column(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.grey,
//               child: Icon(Icons.search, color: Colors.black, size: 30,),
//             ),
//             SizedBox(height: 20,),
//             Card(
//               elevation: 5,
//               color: Colors.yellow,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Text('Abdelrahman'),
//                     Text("Have a good day"),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             Container(
//               color: Colors.green,
//               child: Image.asset(
//                 "images/panda.jpg",
//                 width: 50,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Image.network(
//               "https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960",
//               height: 100,
//               width: 400,
//               fit: BoxFit.cover,
//             ),
//           ],
//         ),