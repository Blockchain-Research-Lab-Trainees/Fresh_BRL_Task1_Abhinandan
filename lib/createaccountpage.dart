import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_task_1/verifiedornotscreen.dart';


final _firebase = FirebaseAuth.instance;


class createaccountpage extends StatefulWidget {
  const createaccountpage({super.key});

  @override
  State<createaccountpage> createState() => _createaccountpageState();

}

final TextEditingController anamecontroller = TextEditingController();
final TextEditingController aemailcontroller = TextEditingController();
final TextEditingController apasswordcontroller = TextEditingController();


class _createaccountpageState extends State<createaccountpage> {
  final _formkakey = GlobalKey<FormState>();

  var userKaEmail = '';
  var userKaPassword = '';
  var userKaName = '';

//ISS WALE FUNCTION KO SIGN UP BUTTON CALL KARTA HAI
  void _signupwithemail() async {
    //print('yha');
      _formkakey.currentState!.validate();
      _formkakey.currentState!.save();

      try {
        await _firebase.createUserWithEmailAndPassword(email: userKaEmail, password: userKaPassword);

        await sendEmailVerification(context);
      } on FirebaseAuthException catch (error){
        if(error.code == 'email-already-in-use'){
          //display smthng
        }
         ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(error.message!),
              ),
          );
      }


  }

  //THIS BELOW ONE IS CALLED BY THE ABOVE FUNCTION ITSELF

  Future<void> sendEmailVerification(BuildContext context) async {
    print('yha tk aa rha h');
    try{
      _firebase.currentUser!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Check your email!'))
      );
    } on FirebaseAuthException catch (error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!)
          )
      );

    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top : 50, left: 20),
              child: Text('Create a New Account'),
            ),


            const SizedBox(height: 50),



            Form(
                key : _formkakey,
                child: Column(
              children: [
     Padding(
  padding: const EdgeInsets.symmetric(horizontal: 30),
  child: Container(

      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10)
      ),

      child : Padding(
        padding: const EdgeInsets.only(left : 8.0),
        child: TextFormField(
          validator: (value){
            if(value==null || value.isEmpty
            )
            {
              print('name is invalid');
              return 'invalid name';
            }
            else{
              print('name is valid');
              return 'valid name';
            }

          },

            controller: anamecontroller,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText : 'Name'
          ),
          // onSaved: (newValue) {
          //   userKaName= newValue!;
          // },
          onSaved: (newValue) {

          },




        ),
      )
  ),
),



    const SizedBox(height: 13),


                //****************** -- email --DUSRA TEXT FIELD*************************

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child : Padding(
                        padding: const EdgeInsets.only(left : 8.0),
                        child: TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty || !value.contains('@') || !value.contains('.com')
                            )
                            {
                              print('email is invalid');
                              return 'invalid email';
                            }
                            else{
                              print('email is valid');
                              return 'valid email';
                            }

                          },
                          controller: aemailcontroller,
                          onSaved: (newValue2) {
                            userKaEmail= newValue2!;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText : 'Email'
                          ),




                        ),
                      )
                  ),
                ),


            //******************* password -- TEESRA TEXT FIELD*************************************
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child : Padding(
                        padding: const EdgeInsets.only(left : 10),
                        child: TextFormField(
                          validator: (value) {
                            //(!value.contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]')))
                            if (value == null || value.isEmpty || value.length < 6)
                            {
                              print('it is not a strong password');
                              return 'Make a strong password';
                            }

                            else {
                              print('this is a strong password');
                              return 'good password';
                            }
                          },
                          controller: apasswordcontroller,
                            onSaved: (newValue) {
                              userKaPassword = newValue!;
                            },
                                            decoration: const InputDecoration(
                                            border: InputBorder.none,
                                                hintText : 'Password'
                                                ),
                          obscureText: true,

                        ),
                      )
                  ),
                ),






              ],
            )
            ),

         //*********************FORM ENDS BUT MAIN COLUMN STILL CONTINUING AND BUTTONS WILL START BELOW**********************************

            const SizedBox(
              height: 90,
            ),

            ElevatedButton(
                onPressed:() {
                  _signupwithemail();
                  print('sign up pressed');
                  //VerfiedOrNot();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerfiedOrNot()
                  )
                  );
                  },
              //Navigator.push(context, MaterialPageRoute(builder : (context) => homepage()));

                child: const Text('Create Account')

            )
          ],
        )
    );
  }
}






// if(!isValid){
//   print ('form not valid');
//   return;
// }


// print(userKaEmail);
// print(userKaPassword);




