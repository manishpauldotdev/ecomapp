import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecomapp/core/providers/providers.dart';
import 'package:ecomapp/core/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyDIl7Ph43NF_oSq3McI0cKCkOQBoqblwCo',
        appId: '1:155544777421:android:49263024313067d4dcaf84',
        messagingSenderId: '155544777421',
        projectId: 'ecomapp-a6605',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const ProviderScope(child: MainApp()));
}

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(hiveProvider).init();

  return unit;
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});
    return ScreenUtilInit(
      // Update the width and height according to your design
      designSize: const Size(414, 896),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OKToast(
          child: MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Ecom App',
            theme: ThemeData(
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
