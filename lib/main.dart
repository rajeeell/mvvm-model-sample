import 'package:flutter/material.dart';
import 'package:mvvm/repository/user_view_model.dart';
import 'package:mvvm/utills/routes/route_name.dart';
import 'package:mvvm/utills/routes/routes.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: Routesname.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
