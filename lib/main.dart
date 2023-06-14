import 'package:flutter/material.dart';
import 'package:my_own_todo/objects/task_list_provider.dart';
import 'package:my_own_todo/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_)=> TaskData(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Nunito',
          scaffoldBackgroundColor: Color(0XFFfbfafb),
          primaryColor: Color(0Xff074f60),
          secondaryHeaderColor: Color(0Xffffac48),
          textTheme: TextTheme(
            headlineLarge: TextStyle(fontSize: 30.0, color: Color(0XFF074f60),fontWeight: FontWeight.bold),
            bodySmall: TextStyle(fontSize: 12.0, color: Color(0Xff9db7bc)),
            bodyLarge: TextStyle(fontSize: 20,color: Color(0XFF074f60),fontWeight: FontWeight.bold)
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}
