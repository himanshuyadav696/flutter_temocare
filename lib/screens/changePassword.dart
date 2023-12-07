import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temocare_flutter/apputils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import '../Api/ApiConstants.dart';
class ChangePassword extends StatefulWidget{
  const ChangePassword({super.key});

  @override
  State<StatefulWidget> createState()=> _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>{
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: SvgPicture.asset("assests/images/backbutton.svg")),
                  const Text("Change Password",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                        decoration:InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(left: 10,right: 5),
                            suffixIcon: const Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.pink)
                            ),
                            hintText: "Old Password"
                        ),
                      controller: oldPassword,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: newPassword,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10,right: 5),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink)
                      ),
                      hintText: "New Password"
                  )
              ),

              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: confirmPassword,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10,right: 5),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pink)
                      ),
                      hintText: "New Confirm Password"
                  )
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                _checkValidation(oldPassword.text,newPassword.text,confirmPassword.text,context);
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))
              ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Change Password",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

void _checkValidation(String oldPassword, String newPassword, String confirmPassword,BuildContext context) {
  if(oldPassword.isEmpty){
    toastMessage("Please enter old password");
  }
  else if(newPassword.isEmpty){
    toastMessage("Please enter new password");
  }
  else if(confirmPassword.isEmpty){
    toastMessage("Please enter confim password");
  }
  else if(newPassword!=confirmPassword){
    toastMessage("new password and confirm new password not matched");
  }
  else{
    _postChangePasswordApi(oldPassword,newPassword,confirmPassword,context);
  }
}

Future<void> _postChangePasswordApi(String oldPassword, String newPassword, String confirmPassword,BuildContext context)  async{
  var accessToken = await SharedPreferencesUtil.getString("accessToken");
  final response = await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.postChangePassword),
    body: {
    'old_password': oldPassword,
    'password': newPassword,
    'confirm_password': confirmPassword,
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