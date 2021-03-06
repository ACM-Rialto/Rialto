import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rialto/locator.dart';
import 'package:rialto/pages/front/front_page.dart';
import 'package:rialto/pages/front/login_page.dart';
import 'package:rialto/pages/front/signup_authentication.dart';
import 'package:rialto/pages/front/signup_page.dart';
import 'package:rialto/viewmodels/contact_crud.dart';
import 'package:rialto/viewmodels/review_crud.dart';

void main() {
  setupLocator();
  runApp(RialtoApp());
}

class RialtoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers: [
        ChangeNotifierProvider(builder: (_) => contactBuyerToSellerLocator<ContactCRUD>()),
        ChangeNotifierProvider(builder: (_) => reviewsLocator<ReviewCRUD>()),
      ],
      child: MaterialApp(
        title: 'Rialto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.redAccent,
          accentColor: Colors.white,
          primaryTextTheme: Typography(platform: TargetPlatform.android).black,
          textTheme: Typography(platform: TargetPlatform.android).black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        routes: {
          '/': (context) => FrontPageViewer(page: LoginPage()),
          '/sign-up': (context) => FrontPageViewer(page: signupPage(auth: Auth())),
        },
      )
    );
  }
}
