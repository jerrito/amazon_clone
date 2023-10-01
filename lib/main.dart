import 'package:flutter/material.dart';
import 'package:amazon_clone/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'amazone/domain/use_cases/auth_service.dart';
import 'amazone/presentation/manager/user_provider.dart';
import 'amazone/presentation/pages/admin/admin_screen.dart';
import 'amazone/presentation/pages/auth_screen.dart';
import 'amazone/presentation/pages/dash_board.dart';
import 'amazone/presentation/widgets/bottombar.dart';
import 'constants/global_variables.dart';


Future<void> main() async {

    runApp(

        MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context)
              =>UserProvider())],
            child: const App()));
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthService authService=AuthService();

@override
void initState(){
  super.initState();
  authService.getAndVerifyUser(context);
}
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings)=>generateRoute(settings),
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const DashBoardScreen()
          : const AdminScreen():const AuthScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
                color: Colors.black
            ),),
          colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor
          )
      ),

    );

  }
}



