import 'dart:html';
import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_notification_armenta/domain/entities/push_message.dart';
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
            }, icon: const Icon(Icons.settings))
          ],
          ),
          body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<PushMessage> notifications = 
    context.watch<NotificationsBloc>().state.notifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index)
      {
       final notification = notifications[index]; 
       return ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.body),
        leading: notification.imageUrl!= null
          ? Image.network(notification.imageUrl!)
          : null,
       );
      }
      
    );

    
  }
}