import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpCaller {
  String _url = 'http://10.0.2.2:8090/';

  Future<http.Response> postMapping(
      {required String urlPart, required dynamic object}) async {
    var url = Uri.parse('${_url}${urlPart}');
    return await http.post(url,
        body: convert.jsonEncode(object), headers: await _getHeader());
  }

  Future<http.Response> getMapping({required String urlPart}) async {
    var url = Uri.parse('${_url}${urlPart}');
    return await http.get(url, headers: await _getHeader());
  }


  Future<http.Response> deleteMapping({required urlPart}) async {
    var url = Uri.parse('${_url}${urlPart}');
    return await http.delete(url, headers: await _getHeader());
  }

 Future<http.Response> putMapping({required urlPart ,required dynamic object}) async {
    var url = Uri.parse('${_url}${urlPart}');
    return await http.put(url, body: convert.jsonEncode(object), headers: await _getHeader());
  }

  dynamic _getHeader() async {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  //  Editing calling Url
  String getUrl({required List pathvariabls, required String url}) {
    //  No waries
    if (pathvariabls == null) {
      return url;
    }

    if (pathvariabls.isEmpty) {
      return url;
    }

    for (var item in pathvariabls) {
      url = '${url}/${item}';
      print('URL ${url}');
    }
    print(' final url URL ${url}');
    return url;
  }
}
