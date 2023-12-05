import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/screens/changePassword.dart';
import '../apputils/utils.dart';
import '../sharedPreferences/SharedPreferencesUtil.dart';
import 'editProfile.dart';
import 'package:http/http.dart' as http;
class ProfileDetail extends StatefulWidget{
  const ProfileDetail({super.key});
  @override
  State<ProfileDetail> createState() => _ProfileState();
}
class _ProfileState extends State<ProfileDetail>{
  String fullName = "";
  String lastName = "";
  String email="";
  String age="";
  String gender="";
  String profilePic ="";
  @override
  void initState() {
    getDoctorList();
  }
  Future<void> getDoctorList() async {
    var accessToken = (await SharedPreferencesUtil.getString("accessToken"))!;
    try {
      var apiUrl = 'https://temocare.com/api/profile/';
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if(data['error']==null){
          var responseData = data['response']['data'];
          setState(() {
            fullName = data['response']['data']['first_name'];
            lastName = data['response']['data']['last_name'];
            email = data['response']['data']['email'];
            age = data['response']['data']['age'];
            gender = data['response']['data']['gender'];
            profilePic = data['response']['data']['profile_image_url'];
            var success= data['response']['message']['successMessage'];
            toastMessage(success);
          });
          print(responseData);
          print(fullName);
          print(lastName);
          print(email);
          print(age);
          print(gender);
          print(profilePic);
          toastMessage("success");
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 170,
                          color: HexColor("#F2A56F"),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assests/images/backbutton.svg"),
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$fullName $lastName",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Contact Number",maxLines: 1,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text("+123456677",maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text(email,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Age",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text(age,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Gender",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text(gender,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 115),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // or any other shape
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(360),
                                child: Image.network(profilePic,fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SvgPicture.asset("assests/images/default_user.png");
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            child: SizedBox(
                              height: 35,
                              width: 60,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.pink, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Edit",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.pink
                                ),)),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context){
                                return EditProfile();
                              }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return ChangePassword();
                          }));
                    },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                        side: MaterialStateProperty.all(BorderSide(
                          color: Colors.pink,
                        )),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Change Password",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.pink
                    ),),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 300,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset("assests/images/ic_delete.svg"),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 20),
                                                  child: Text("Are you sure ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 24),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                                                  child: Center(child: Text("You want to delete your account this action can’t be undone",textAlign: TextAlign.center,style: TextStyle(height: 1.5,color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
                                                            ),
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                                              child: Text("Yes",style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w600,
                                                              ),
                                                              ),
                                                            )),
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        child: OutlinedButton(
                                                            style: ButtonStyle(
                                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                                                side: MaterialStateProperty.all(BorderSide(color: Colors.pink,width: 2))
                                                            ),
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                                              child: Text("No",style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w600
                                                              ),
                                                              ),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10,right: 10),
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                                child: SvgPicture.asset("assests/images/Cross.svg")),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.pink),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Delete Account",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Container(
          child: Column(
            children: [
              SvgPicture.asset("assets/images/ic_delete.svg"),
              const Text("Are you sure ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 24),)
            ],
          ),
        ),
      ),
    );
  }
}


