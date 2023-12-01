import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:temocare_flutter/screens/myAppointment.dart';
import 'package:temocare_flutter/screens/profileDetail.dart';
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import '../Models/Welcome.dart';
import '../apputils/utils.dart';
import 'doctorDetail.dart';
class HomeScreen extends StatelessWidget{
  Map<String, dynamic> data1;
  HomeScreen(this.data1, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firstName;
  var lastName;
  var profile;
  var accessToken;
  List<Result> results = [];

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    getDoctorList(accessToken.toString());

  }

  void _initSharedPreferences() async {
    firstName = await SharedPreferencesUtil.getString("firstName");
    lastName = await SharedPreferencesUtil.getString("lastName");
    profile = await SharedPreferencesUtil.getString("profileImage");
    accessToken = await SharedPreferencesUtil.getString("accessToken");
    print(firstName);
    print(lastName);
    print(profile);
    print("accessToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){

            }, icon: Icon(
                Icons.home
            )),
            IconButton(onPressed: (){

            }, icon: Icon(
                Icons.calendar_month
            )),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return myAppointment();
              }));
            }, icon: Icon(
                Icons.calendar_month_sharp
            )),
            IconButton(onPressed: (){

            }, icon: SvgPicture.asset(
              "assests/images/ic_profile.svg",
              semanticsLabel: "Profile",
            ))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Hello",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$firstName $lastName",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return ProfileDetail();
                        }));
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          child: Image.network(profile.toString()),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Card(
                        color: HexColor("#F2A56F"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 50,bottom: 40,left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text("Get the best",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("Medical Services",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Image.asset("assests/images/iv_doctor.png")
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height:90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Image.asset("assests/images/iv_doctor.png"),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Dr Himanshu",style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                          Text("Neurologist",style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          Row(
                                            children: [
                                              Text("20 | ",style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Text("Exp: 5 years",style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                                      return doctorDetail();
                                                    }));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Container(
                                                      width: 140,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: HexColor("#ED787E")),
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      ),
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text("Appointment",style: TextStyle(
                                                            color: HexColor("#ED787E"),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16
                                                        ),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Future<void> getDoctorList(String accessToken) async {
  try {
    var apiUrl = 'https://temocare.com/api/sets/doctors/';
    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if(data['error']==null){
        var responseData = data['response']['data']['results'];
        print('Response Data: $responseData');
        var success = data['response']['message']['success'];
        var successCode = data['response']['message']['successCode'];
        var statusCode = data['response']['message']['statusCode'];
        var successMessage = data['response']['message']['successMessage'];
        toastMessage(successMessage);
      }
      else{
        String errorMessage = data['error']['errorMessage'];
        print('Error: ${data['error']['errorMessage']}');
        toastMessage(errorMessage);
      }
    } else {
     // print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}

