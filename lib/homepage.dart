import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_task_1/main.dart';
import 'package:fresh_task_1/verifiedornotscreen.dart';



class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 45),
          const Text('Welcome  :)', style: TextStyle(fontFamily: 'Schyler',fontSize: 20,fontWeight: FontWeight.w500),),
          const SizedBox(height: 45),
          const Center(
            child: SizedBox(
              width : 300,
              height : 300,
              // decoration : BoxDecoration(
              //     image : DecorationImage(
              //         image: AssetImage('assets/images/readrhino.png'),

              child: Text('Logged In'),
            ),
          ),

          const SizedBox(height: 50),

          ElevatedButton(onPressed:() async {

            FirebaseAuth.instance.signOut();

            //await FirebaseServices().signOut();

            Navigator.pop(context, MaterialPageRoute(builder:
            (context)=>homepage()
            )
            );


            Navigator.push(context, MaterialPageRoute(
              builder : (context)=> MyHomePage(title: 'title')
             )
           );
         },
              child: const Text('Sign Out')
          )
        ],
      ),
    );
  }
}

