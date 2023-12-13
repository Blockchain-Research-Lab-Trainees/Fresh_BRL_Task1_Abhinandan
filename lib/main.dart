import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_task_1/notverifiedscreen.dart';
import 'package:fresh_task_1/loading.dart';
import 'package:fresh_task_1/login screen.dart';
import 'package:fresh_task_1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fresh_task_1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


//remove until


 void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  //future widget MyApp
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      //home : const createaccountpage(),
       home: const MyHomePage(title: 'Flutter Demo Home Page'),
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


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //home: loginscreen()

      home : StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder : (ctx, snapshot){

          if (snapshot.connectionState == ConnectionState.waiting){
            return const splashscreen();
          }


          if(snapshot.hasData){
            //print('loggedin hai');
            return const homepage();
          }



else
    {      return const loginscreen();}

        }
      )


      );

  }
}
