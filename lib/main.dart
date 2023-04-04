import 'package:agrotech_hackat/constants/colors.dart';
import 'package:agrotech_hackat/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ;
  runApp(const CloudMallApp());
}

class CloudMallApp extends StatelessWidget {
  const CloudMallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'FarmX',
            theme: ThemeData(
              //primarySwatch:MaterialColor (,mallBlue),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: mainGreen,
                secondary: mainGreen,
              ),
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
            initialRoute: "/splash",
            getPages: [
              GetPage(name: '/splash', page: () => const LandingPage()),
            ]);
      },
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
