import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tikto_app/src/app/core/services/api_service.dart'; 
class HttpServiceImpl extends ApiService {
   
  final http.Client _client; 
  HttpServiceImpl(this._client);  

  @override 
  Future<ApiResponse> get(String endpoint, {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async {

    final response = await _client.get(
      Uri.parse(endpoint),
    );
    return _dioToApiresponse(response);
  }
  
   ApiResponse _dioToApiresponse(Response response) => ApiResponse(
        response.body,
        response.statusCode,
        response.reasonPhrase,
      );
 

}