import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad1_shopping_3c/screens/product_listing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  ShoppingApp({super.key});

  final colorScheme = ColorScheme.fromSeed(seedColor: Color(0xFF3081D0));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.primaryContainer,
        ),
        // textTheme: const TextTheme().copyWith(
        //   displayMedium: GoogleFonts.ubuntuCondensed(
        //     fontSize: 24,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
          displayMedium: GoogleFonts.ubuntuCondensed(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: ProductListingScreen(),
    );
  }
}
