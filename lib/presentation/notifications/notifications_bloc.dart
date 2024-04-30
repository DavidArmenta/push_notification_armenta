import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationsBloc() : super(const NotificationsState()) {
    // on<NotificationsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
  static Future<void> initianlizeFcm() async{
    await Firebase.initializeApp(
     // options: defaultFirebase.currentPlataform,
    
    );
  }
  void requestPermission() async {
NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
settings.authorizationStatus;
  }
}
