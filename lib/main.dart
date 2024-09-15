import 'package:my_balemoya_app/UI/controllers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_balemoya_app/UI/homepage.dart';
import 'package:my_balemoya_app/constants/app_constants.dart';
import 'package:my_balemoya_app/controllers/exports.dart';
import 'package:provider/provider.dart';
import 'package:my_balemoya_app/data/local_string.dart';
import 'Itu/screen/wallet_screen.dart';
import 'UI/my_wallet/mywallet.dart';
import 'common/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => ZoomNotifier()),
    ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    ChangeNotifierProvider(create: (context) => JobsNotifier()),
    ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
    ChangeNotifierProvider(create: (context) => ImageUpoader()),
    ChangeNotifierProvider(create: (context) => ProfileNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: const Size(360, 690),
        builder: (context, child) {
          return GetMaterialApp(
            translations: LocalString(),
            locale: const Locale("en", "US"),
            debugShowCheckedModeBanner: false,
            title: 'Hello Balemuya',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(kLight.value),
              iconTheme: IconThemeData(color: Color(kDark.value)),
            ),
            home: const MyWalletPage(),
          );
        });
  }
}
