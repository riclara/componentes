import 'package:flutter/material.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Spanish
      ],
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( settings ) {
        return MaterialPageRoute(
          builder: ( context ) => AlertPage()
        );
      },
    );
  }
}
