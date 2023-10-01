import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/use_cases/auth_service.dart';
import '../widgets/app_buttons.dart';
import '../widgets/text_fields.dart';
enum Sign{
signIn,
  signUp
}
// class AuthProvider extends StatelessWidget {
//   const AuthProvider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: [
//       User
//     ]);
//   }
// }

class AuthScreen extends StatefulWidget {
  static const String routeName="/authScreen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Sign _signType=Sign.signUp;
  final AuthService authService=AuthService();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  String signText="Sign Up";
  bool loading=false;

  Future<void> signUp()async {
   await  authService.signUpUser(context: context,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text)
       .whenComplete(() =>
       setState((){
         loading=false;
       })
   );
  }

  Future<void> signIn()async {
    await  authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text)
        .whenComplete(() =>
        setState((){
          loading=false;
        })
    );
  }
  @override
  void dispose(){
    super.dispose();
  nameController.dispose();
  emailController.dispose();
  passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible:!loading,
            replacement:const Center(
              child: CircularProgressIndicator(
              ),),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Expanded(
                    child: ListView(
                      children: [
                        const Text("Welcome",style:TextStyle(
                          fontSize:25,fontWeight:FontWeight.bold,
                            fontStyle:FontStyle.italic
                        )),

                    const SizedBox(height: 20,),
                    ListTile(
                      onTap:(){
                        setState(() {
                          _signType=Sign.signUp;
                          signText="Sign Up";
                        });
                      } ,
                      title: const Text("Sign Up",style:TextStyle(
                          fontSize:24,
                      )),
                      leading: Radio(value: Sign.signUp,
                          groupValue:_signType ,
                          onChanged: (value){
                            setState(() {
                              _signType=value!;
                              signText="Sign Up";
                            });
                          }),
                    ),
                    Visibility(
                      visible: _signType==Sign.signUp,
                      child: PrimaryTextFormField(
                        hintText: "FullName",
                        label: const Text("FullName"),
                       controller: nameController,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    PrimaryTextFormField(
                      hintText: "Email",

                      label: const Text("Email"),
                      controller: emailController,
                    ),
                    const SizedBox(height: 20,),
                    PrimaryTextFormField(
                      validator: (value){
                        if(value!.length<6){
                          return "Password length is less than 6";
                        }
                        return null;
                      },
                      hintText: "Password",
                      label: const Text("Password"),
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20,),

                  DefaultPrimaryButton(
                    onPressed:loading?null: ()async{
                      if(formKey.currentState!.validate()) {
                        if(_signType==Sign.signUp) {
                          setState(() {
                            loading = true;
                          });
                          await signUp();
                        }
                        else{
                          setState(() {
                            loading = true;
                          });
                          nameController.text="";
                          await signIn();
                        }
                      }
                    },
                      child: Text(signText,
                          style:const TextStyle(
                          fontSize:18,
                      )) ),
                  const SizedBox(height: 20,),
                  ListTile(
                    onTap:(){
                      setState(() {
                        _signType=Sign.signIn;
                        signText="Sign In";
                        //nameController.text="";
                      });
                    } ,
                    title: const Text("Sign In",style:TextStyle(
                        fontSize:24,
                    )),
                    leading: Radio(value: Sign.signIn,
                        groupValue:_signType,
                        onChanged: (value){
                          setState(() {
                            _signType=value!;
                          });

                        }),
                  ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      );
  }
}
