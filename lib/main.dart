
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:temocare_flutter/screens/RegisterationScreen.dart';
import 'package:temocare_flutter/screens/Splash.dart';
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import 'Api/ApiConstants.dart';
import 'apputils/utils.dart';
import 'screens/HomeScreen.dart';
import 'screens/forgotEmail.dart';
void main() {
  runApp(const MyApp(title: 'Hello',));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required String title});
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
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(true);
  bool _loading = false ;
  final imgUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  bool downloading = false;
  var progressString = "";
  var userName ="";
  var userrofile = "";
  void _login(String email, String password) async{
    setState(() {
      _loading = true;
    });
    final response = await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndPoint),body: {
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
          var profilePic = responseData['profile_image_url'];
          var accessToken = responseData['accessToken'];
          var success = data['response']['message']['success'];
          var successCode = data['response']['message']['successCode'];
          var statusCode = data['response']['message']['statusCode'];
          var successMessage = data['response']['message']['successMessage'];
          await SharedPreferencesUtil.saveString("accessToken", accessToken);
          await SharedPreferencesUtil.saveString("profilePic", profilePic);
          await SharedPreferencesUtil.saveBool("isLoginFirst", true);
          print('User ID: $userId');
          print('Name: $firstName $lastName');
          print("accessToken $accessToken");
          print('Success: $success');
          print('Success Code: $successCode');
          print('Status Code: $statusCode');
          print('Success Message: $successMessage');
          toastMessage(successMessage);
          _navigateToHomeScreen(responseData);
          setState(() {
            _loading = false;
          });
        } else {
          String errorMessage = data['error']['errorMessage'];
          print('Error: ${data['error']['errorMessage']}');
          toastMessage(errorMessage);
          setState(() {
            _loading = false;
          });
        }
      } else {
        print('Error: ${response.statusCode}');
        setState(() {
          _loading = false;
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _loading = false;
      });
    }
  }

  void _navigateToHomeScreen(Map<String, dynamic> data) {
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return const HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                     focusNode: emailFocusNode,
                     decoration:InputDecoration(
                         isDense: true,
                         contentPadding: const EdgeInsets.only(left: 10,right: 5),
                         suffixIcon: const Icon(Icons.email),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         hintText: "Enter your email",
                     ),
                   onSubmitted: (value){
                     Utils.focusChange(context,emailFocusNode, passwordFocusNode);
                   }
                 ),
               ),
               ValueListenableBuilder(
                 valueListenable: valueNotifier,
                 builder: (BuildContext context, bool value, Widget? child) {
                   return  Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: TextField(
                         controller: password,
                         focusNode: passwordFocusNode,
                         obscureText: valueNotifier.value,
                         obscuringCharacter: "*",
                         decoration:InputDecoration(
                             isDense: true,
                             contentPadding: const EdgeInsets.only(left: 10,right: 5),
                             suffixIcon: InkWell(
                               onTap: (){
                                 valueNotifier.value = !valueNotifier.value;
                               },
                                 child: valueNotifier.value? Icon(Icons.visibility_off_outlined):
                                 Icon(Icons.visibility)
                             ),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             hintText: "Password"
                         ),
                         onSubmitted: (value){
                           Utils.focusChange(context,passwordFocusNode, emailFocusNode);
                         }
                     ),
                   );
                 },
               ),
                Align(
                 alignment: Alignment.topRight,
                 child: Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(context){
                         return const ForgotEmail();
                       }));
                     },
                     child: const Text(
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
                     checkValidation(email.text,password.text);
                   },
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.pink,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                         )
                       ),
                       child:_loading?CircularProgressIndicator():Text("Sign In",style: TextStyle(
                         color: Colors.white
                       ),),
                   ),
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
                               return const RegisterationScreen();
                             }));
                           },
                           child: const Text("Sign up",style:
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

  void checkValidation(String email,String password) {
    if(email.isEmpty){
      toastMessage("Please enter email");
    }
    else if(password.isEmpty){
      toastMessage("Please enter password");
    }
    else{
      _login(email,password);
    }
  }
}



