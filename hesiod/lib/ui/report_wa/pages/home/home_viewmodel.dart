import 'package:hesiod/services/hive_service.dart';
import 'package:hesiod/services/user_service.dart';
import 'package:mobx/mobx.dart';
import 'package:hesiod/helpers/viewmodel.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = AbstractHomeViewModel with _$HomeViewModel;

abstract class AbstractHomeViewModel extends ViewModel with Store {
  final HiveService _hiveService;
  final UserService _userService;
  AbstractHomeViewModel(this._hiveService, this._userService);

  @observable
  bool isLoading = false;

  // @observable
  // ProfileDTO? profileDetails;

  // @action
  // Future getProfileDetails() async {
  //   if (isLoading) return;
  //   isLoading = true;
  //   var profileDetailsResponse = await _userService.getUserInfo();
  //   if (profileDetailsResponse.isSuccess &&
  //       profileDetailsResponse.payload != null) {
  //     profileDetails = ProfileDTO.fromMap(profileDetailsResponse.payload);
  //     _hiveService.addProfileDetails(profileDetails!);
  //   } else {
  //     profileDetails = _hiveService.getProfileDetails();
  //   }
  //   isLoading = false;
  // }
}
