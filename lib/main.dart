
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/HomeScreen.dart';
import 'package:temocare_flutter/RegisterationScreen.dart';
import 'package:temocare_flutter/Splash.dart';
import 'package:temocare_flutter/forgotEmail.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
         child: Padding(
           padding: const EdgeInsets.only(top: 220,left: 16,right: 16),
           child: Column(
             children: [
               Row(
                 children:  [
                   SizedBox(
                     height: 40,
                       width: 40,
                       child: SvgPicture.asset("assests/images/temocare_logo.svg")),
                   Text("Temo",style: TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 30,
                     color: HexColor("#ED787E")
                   ),),
                   const Text("Care",style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 26
                   ),),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: TextField(
                     decoration:InputDecoration(
                         isDense: true,
                         contentPadding: const EdgeInsets.only(left: 10,right: 5),
                         suffixIcon: const Icon(Icons.email),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         hintText: "Enter your email"
                     )
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: TextField(
                     decoration:InputDecoration(
                         isDense: true,
                         contentPadding: const EdgeInsets.only(left: 10,right: 5),
                         suffixIcon: const Icon(Icons.remove_red_eye),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         hintText: "Password"
                     )
                 ),
               ),
                Align(
                 alignment: Alignment.topRight,
                 child: Padding(
                   padding: EdgeInsets.only(top: 10),
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(context){
                         return ForgotEmail();
                       }));
                     },
                     child: Text(
                       "Forgot password ?",
                       style: TextStyle(color: Colors.blue),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:40),
                 child: SizedBox(
                   width: double.infinity,
                   height: 50,
                   child: ElevatedButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return HomeScreen();
                     }));
                   },
                       style: ElevatedButton.styleFrom(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                         )
                       ),
                       child:const Text("Sigin In")),
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.only(top: 50),
                 child: Text("Or login with",style: TextStyle(
                   fontSize: 14
                 ),),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 30),
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: Card(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                         ),
                         elevation: 2,
                         child: SizedBox(
                           height: 50,
                             width: 50,
                             child: Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: SvgPicture.asset("assests/images/ic_google.svg"),
                             )
                         ),
                       ),
                     ),
                     Card(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       elevation: 2,
                       child: SizedBox(
                           height: 50,
                           width: 50,
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: SvgPicture.asset("assests/images/facebook.svg"),
                           )
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  [
                         const Padding(
                           padding: EdgeInsets.only(right: 5),
                           child: Text("Don’t have an account?",style:
                             TextStyle(fontSize: 14),),
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context){
                               return RegisterationScreen();
                             }));
                           },
                           child: Text("Sign up",style:
                           TextStyle(fontSize: 14,color: Colors.blue),),
                         )
                       ],
                     )
                   ],
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

