import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class RegisterationScreen extends StatelessWidget{
  RegisterationScreen({super.key});
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
