import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ChangePassword extends StatefulWidget{
  const ChangePassword({super.key});

  @override
  State<StatefulWidget> createState()=> _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>{
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
                                borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: "Old Password"
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10,right: 5),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "New Password"
                  )
              ),

              const SizedBox(
                height: 20,
              ),
              TextField(
                  decoration:InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 10,right: 5),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "New Confirm Password"
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}