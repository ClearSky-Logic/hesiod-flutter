import 'package:event/event.dart';

class EventBus {
  static final EventBus _eventBus = EventBus._internal();

  factory EventBus() {
    return _eventBus;
  }

  EventBus._internal();

  // static final updateProfileDetails = Event();
  // static final updateTeams = Event();
  // static final updateTeamMembersPage = Event();
  // static final updateTeamSplitPage = Event();
}
