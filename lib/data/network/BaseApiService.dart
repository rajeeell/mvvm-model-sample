abstract class BaseApiServices {
  Future<dynamic> getAPiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
