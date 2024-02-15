import 'package:flutter/widgets.dart';
import 'package:hesiod/helpers/startable.dart';
import 'package:hesiod/infrastructure/viewmodelfactory.dart';
import 'package:hesiod/managers/authmanager.dart';
import 'package:hesiod/services/api_service.dart';
import 'package:hesiod/services/event_service.dart';
import 'package:hesiod/services/hive_service.dart';
import 'package:hesiod/services/user_service.dart';

class ServiceLocator implements Startable {
  /// Services
  ApiService? apiService;
  HiveService? hiveService;
  EventService? eventService;
  UserService? userService;
  BuildContext? context;

  // /// Infra
  ViewModelFactory? viewModelFactory;

  // /// Global State
  AuthManager? authManager;

  /// Creates a new container for our services and instantiates them
  ServiceLocator() {
    apiService = ApiService();
    viewModelFactory = ViewModelFactory(this);
    hiveService = HiveService();
    eventService = EventService();

    userService = UserService(apiService!);
  }

  @visibleForTesting
  ServiceLocator.empty();

  /// Runs any required startup code for all our services
  @override
  Future start() async {
    // Order can be important here if the services depend on each other
  }
}
