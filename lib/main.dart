import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_dashboard_matrix/controllers/menu_controller.dart' as a;
import 'package:web_dashboard_matrix/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => a.MenuController()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
//start to make responsive website
//first make app responsive class
///remove home page and use Multiprovider wedget