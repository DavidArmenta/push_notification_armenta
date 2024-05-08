import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_notification_armenta/config/router/app_router.dart';
import 'package:push_notification_armenta/config/router/theme/app_theme.dart';
import 'package:push_notification_armenta/presentation/notifications/notifications_bloc.dart';
import 'package:push_notification_armenta/presentation/provider/head_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializeFCM();
  runApp(HeadProvider.initProvider(mainAppWidget: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}