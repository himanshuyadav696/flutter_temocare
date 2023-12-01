
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:temocare_flutter/screens/RegisterationScreen.dart';
import 'package:temocare_flutter/screens/Splash.dart';
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import '../apputils/utils.dart';
import 'HomeScreen.dart';
import 'forgotEmail.dart';
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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final imgUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  bool downloading = false;
  var progressString = "";
  var userName ="";
  var userrofile = "";

  void _login(String email, String password) async{
    final response = await http.post(Uri.parse("https://temocare.com/api/login/"),body: {
      'email': email,
      'password': password,
      'deviceType': "1",
      'deviceToken':"abc1123"
    },);
    print('Request Body: ${json.encode(response.toString())}');
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['error'] == null) {
          var responseData = data['response']['data'];
          var userId = responseData['userId'];
          var firstName = responseData['first_name'];
          var lastName = responseData['last_name'];
          var accessToken = responseData['accessToken'];
          var success = data['response']['message']['success'];
          var successCode = data['response']['message']['successCode'];
          var statusCode = data['response']['message']['statusCode'];
          var successMessage = data['response']['message']['successMessage'];
          await SharedPreferencesUtil.saveString("accessToken", accessToken);
          print('User ID: $userId');
          print('Name: $firstName $lastName');
          print("accessToken $accessToken");
          print('Success: $success');
          print('Success Code: $successCode');
          print('Status Code: $statusCode');
          print('Success Message: $successMessage');
          toastMessage(successMessage);
          _navigateToHomeScreen(responseData);
        } else {
          String errorMessage = data['error']['errorMessage'];
          print('Error: ${data['error']['errorMessage']}');
          toastMessage(errorMessage);
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void _navigateToHomeScreen(Map<String, dynamic> data) {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return HomeScreen(data);
    }));
  }

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
                   controller: email,
                     decoration:InputDecoration(
                         isDense: true,
                         contentPadding: const EdgeInsets.only(left: 10,right: 5),
                         suffixIcon: const Icon(Icons.email),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         hintText: "Enter your email",
                     )
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: TextField(
                   controller: password,
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
                     _login(email.text.toString(),password.text.toString());
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



