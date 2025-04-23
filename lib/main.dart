import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_affirmation_counter/bloc/auth/auth_bloc.dart';
import 'package:flutter_affirmation_counter/bloc/auth/auth_status.dart';
import 'package:flutter_affirmation_counter/cache/auth_cache_manager.dart';
import 'package:flutter_affirmation_counter/env_config.dart';
import 'package:flutter_affirmation_counter/routing/app_router.dart';
import 'package:flutter_affirmation_counter/routing/navigate_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // load flavor
  const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'prod');
  await EnvConfig.load(flavor);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          // AuthBloc must be global accessible, that's why it has been put here
          create: (_) => AuthBloc(
              AuthCacheManager())
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  late final AuthBloc authBloc;

  @override
  void initState() {
    super.initState();

    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),
      onGenerateRoute: _appRouter.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
