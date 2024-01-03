
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/Api/ApiConstants.dart';
import 'package:temocare_flutter/screens/profileDetail.dart';
import 'package:http/http.dart' as http;
import '../apputils/utils.dart';
import '../sharedPreferences/SharedPreferencesUtil.dart';

class EditProfile extends StatefulWidget{
  final ProfileData profileData;
  const EditProfile({super.key, required this.profileData});
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile>{
  late ProfileData showProfileData;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  String profilePc = "";
  @override
  void initState() {
    super.initState();
    showProfileData = widget.profileData;
    firstName = TextEditingController(text: showProfileData.fullName);
    lastName = TextEditingController(text: showProfileData.lastName);
    email = TextEditingController(text: showProfileData.email);
    age = TextEditingController(text: showProfileData.age);
    gender = TextEditingController(text: showProfileData.gender);
    profilePc = showProfileData.profilePic;
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 115),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Card(
                                elevation: 4,
                                shape: const CircleBorder(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                    child: Image.network(profilePc.toString())),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Name",style: TextStyle(
                                  fontSize: 16,
                                  color: HexColor("#82B8BC"),
                                  fontWeight: FontWeight.w400
                                ),),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  controller:firstName,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Lucy",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Last Name",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  controller:lastName,
                                  keyboardType: TextInputType.name,
                                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Martin",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Email",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "lucy@yopmail.com",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Age",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  controller: age,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "18",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Gender",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  controller: gender,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Male",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.pink),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                              ))
                            ),
                              onPressed: (){
                              postUpdateProfil(
                                  firstName.text,
                                  lastName.text,
                                  email.text,
                                  age.text,
                                  gender.text,
                                  profilePc,
                                  context
                              );},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                child: Text("Update",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                          ),
                              )),
                        ),
                        SizedBox(
                          height: 60,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              side: MaterialStateProperty.all(const BorderSide(color: Colors.pink,width: 2))
                            ),
                              onPressed: (){
                              Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                child: Text("Cancel",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.pink
                                ),
                                ),
                              )),
                        )
                      ],
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
void postUpdateProfil(
    String firstName,
    String lastName,
    String email,
    String age,
    String gender,
    String profilePc,
    BuildContext context
    ) async {
  var accessToken = (await SharedPreferencesUtil.getString("accessToken"))!;
  final response = await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.postUpdateProfile),
    body: {
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'email' :email,
      'deviceType':"1",
      'age':age,
      'pic':profilePc
    },
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );
  print('Request Body: ${json.encode(response.toString())}');
  try {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['error'] == null) {
        if(data['data']==null){
          print("API Response: ${response.body}");
          var success = data['response']['message']['success'];
          var successCode = data['response']['message']['successCode'];
          var statusCode = data['response']['message']['statusCode'];
          var successMessage = data['response']['message']['successMessage'];
          print(success);
          print(successCode);
          print(statusCode);
          toastMessage(successMessage);
          Navigator.pop(context);
        }
        else{
          print("API Response: ${response.body}");
        }
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