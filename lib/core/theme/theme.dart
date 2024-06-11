part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
    fontFamily: 'SF Pro Text',
    elevatedButtonTheme: _elevatedButton(),
    textButtonTheme: _textButton(),
    appBarTheme: _appBarThem(),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(),
    tabBarTheme: const TabBarTheme(
      tabAlignment: TabAlignment.start,
      labelPadding: EdgeInsets.only(right: 50),
      labelColor: Colors.black,
      labelStyle:
          TextStyle(fontWeight: FontWeight.w500, fontFamily: 'SF Pro Text'),
      unselectedLabelStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'SF Pro Text'),
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
      minimumSize: const MaterialStatePropertyAll(
        Size(double.maxFinite, 0),
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
            Radius.circular(41),
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color.fromRGBO(215, 215, 215, 1);
          }
          return Colors.black;
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
      overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.1)),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(
        Size(double.maxFinite, 0),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    ),
  );
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontFamily: 'Poppins',
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
  );
}
