
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
  Future post(
      {required Uri url,
      required Map<String, String> headers,
      required Object body});
}

class HttpClient implements IHttpClient {
  final client = http.Client();
  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future post(
      {required Uri url,
      required Map<String, String> headers,
      required Object body}) async {
    return await client.post(url, headers: headers, body: body);
  }
}
