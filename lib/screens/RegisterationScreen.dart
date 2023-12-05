import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:temocare_flutter/apputils/utils.dart';
import 'package:http/http.dart' as http;
import 'forgotEmail.dart';
class RegisterationScreen extends StatelessWidget{
  RegisterationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: registerScreen(),
    );
  }
}


class registerScreen extends StatefulWidget{
  @override
  _registerScreen createState()=>_registerScreen();
}

class _registerScreen extends State<registerScreen>{
  TextEditingController firsstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confimPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Registration")
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: ExactAssetImage(
                        'assests/images/default_user.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 16,right: 16),
              child: TextField(
                controller: firsstName,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Enter name"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: lastName,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Last Name"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: email,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Email"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: age,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Age"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: gender,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Gender"
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: password,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Password"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                controller: confimPassword,
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Confirm Password"
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: const [
                  checkBox(),
                  Text("I accept",style: TextStyle(
                    fontSize: 14
                  ),),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Privacy Policy",style: TextStyle(
                        fontSize: 14,color: Colors.blue
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("and",style: TextStyle(
                        fontSize: 14
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Terms and Conditions",style: TextStyle(
                        fontSize: 14,color: Colors.blue
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15,left: 16,right: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  checkValidation();
                },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                    child:Text("Sign Up")),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have and account ?",style: TextStyle(
                    fontSize: 14
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Sign In",style: TextStyle(
                        fontSize: 14,color: Colors.blue
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkValidation() {
    if(firsstName.text.isEmpty){
      toastMessage("Please enter fist name");
    }
    else if(lastName.text.isEmpty){
      toastMessage("Please enter last name");
    }
    else if(email.text.isEmpty){
      toastMessage("Please enter email name");
    }
    else if(age.text.isEmpty){
      toastMessage("Please enter age name");
    }
    else if(gender.text.isEmpty){
      toastMessage("Please enter gender name");
    }
    else if(password.text.isEmpty){
      toastMessage("Please enter password name");
    }
    else if(confimPassword.text.isEmpty){
      toastMessage("Please enter confirm password name");
    }
    else if(password.text!=confimPassword.text){
      toastMessage("password confirm password not matched");
    }
    else{
      registerApi(firsstName.text,lastName.text,email.text,age.text,gender.text,password.text,confimPassword.text);
    }
  }
  void registerApi(String firsstName, String lastName, String email, String age, String gender, String password, String confimPassword) async {
    const String apiUrl = 'https://temocare.com/api/reg/';
    Map<String, dynamic> requestBody = {
      "first_name": firsstName,
      "last_name": lastName,
      "gender": gender,
      "email": email,
      "deviceType": 1,
      "age": "24",
      "password": password,
      "confirm_password": confimPassword,
      "agree_terms": true,
      "deviceToken": "",
    };
    String requestBodyString = jsonEncode(requestBody);
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: requestBodyString,
      );
      if (response.statusCode == 201) {
        var data = json.decode(response.body);
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
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return OtpScreen();
          }));
        }
        else{
          print("API Response: ${response.body}");
        }
      } else {
        var error = json.decode(response.body);
        var statusCode = error['error']['statusCode'];
        var errorCode = error['error']['errorCode'];
        var errorMessage = error['error']['errorMessage'];
        toastMessage(errorMessage);
        print(statusCode);
        print(errorCode);
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}

class checkBox extends StatefulWidget {
  const checkBox({Key? key}) : super(key: key);

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return
        Checkbox(value: value,
            onChanged: (bool? value){
          setState(() {
            this.value = value!;
            print("$value");
          });
            }
        );
  }
}
