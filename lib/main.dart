import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/bottom_nav_bar/cubit.dart';
import 'cubits/cart/cubit.dart';
import 'cubits/session/cubit.dart';
import 'firebase_options.dart';
import 'repositories/auth_repository.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authRepository = AuthRepository();
  final sessionCubit = SessionCubit(authRepository);
  await sessionCubit.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SessionCubit>.value(value: sessionCubit),
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        BlocProvider<BottomNavBarCubit>(create: (_) => BottomNavBarCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 8,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff1d2734),
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Color(0xff1d2734),
                  systemNavigationBarDividerColor: Color(0xff1d2734),
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark
              )
          )
      ),
      home: const SplashScreen(),
    );
  }
}
