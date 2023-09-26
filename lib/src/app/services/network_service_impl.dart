import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tikto_app/src/app/core/services/network_service.dart';

class NetworkServiceImpl extends NetworkService {
  final InternetConnectionChecker _checker = InternetConnectionChecker();

  @override
  Future<bool> isConnected() async => await _checker.hasConnection;
}