import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notification_armenta/presentation/notifications/notifications_bloc.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: const Text('push notification'),
          title: 
          context.select((NotificationsBloc bloc) => Text('${bloc.state.status}')),
          actions: [
            IconButton(onPressed: (){
              context.read<NotificationsBloc>().requestPermission();
            }, icon: const Icon(Icons.abc))
          ],
          ),
          body: Center(
            child: Text('alo'),
          ),
    );
  }
}