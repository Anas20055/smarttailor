part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backColor,
    elevatedButtonTheme: _elevatedButton(),
    textButtonTheme: _textButton(),
    appBarTheme: _appBarThem(),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      tabAlignment: TabAlignment.start,
      labelPadding: EdgeInsets.only(right: 50),
      labelColor: Colors.black,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelColor: Colors.grey,
      overlayColor: MaterialStatePropertyAll(Colors.white),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
          ),
          insets: EdgeInsets.symmetric(horizontal: 27.0, vertical: 15)),
    ),
  );
}

TextButtonThemeData _textButton() {
  return TextButtonThemeData(
    style: ButtonStyle(
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.black,
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      overlayColor: const MaterialStatePropertyAll(Colors.grey),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

ElevatedButtonThemeData _elevatedButton() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color.fromRGBO(215, 215, 215, 1);
          }
          return AppColors.darkBlue;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.white;
        },
      ),
      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.1)),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 20,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(
        Size(double.maxFinite, 0),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    ),
  );
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    backgroundColor: AppColors.backColor,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    elevation: 0,
  );
}
