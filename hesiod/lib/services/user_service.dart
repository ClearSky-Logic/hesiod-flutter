import 'package:hesiod/domain/models/api/response_model.dart';
import 'package:hesiod/services/api_service.dart';

class UserService {
  final ApiService _apiService;

  UserService(this._apiService);

  // Future<ResponseModel> getUserInfo() async {
  //   var token = await _firebaseAuthService.updateToken();
  //   var result =
  //       await _apiService.getRequest(EndpointConstants.profileEndpoint, token!);
  //   return result.isSuccess
  //       ? ResponseModel(result.content, result.isSuccess)
  //       : ResponseModel(result.message, result.isSuccess);
  // }
}
