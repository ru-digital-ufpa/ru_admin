import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  List<dynamic> cardapio = [];
  List<dynamic> news = [];

  NetworkHelper();

  Future getData() async {
    Uri url = Uri.parse('https://prinako-ru.cyclic.app/api');
    // Uri url = Uri.parse('http://ru.server.net/api');

    http.Response response = await http.get(
      url,
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      cardapio = json;
      //print(cardapio);
      return cardapio;
    } else {
      // print(response.statusCode);
    }
  }

  Future postMsg(data) async {
    // print(data);
    Uri url = Uri.parse('https://prinako-ru.cyclic.app/news');
    // Uri url = Uri.parse('http://10.0.0.126:5500/news');

    try {
      http.Response response = await http.post(
        url,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: data,
      );

      print(response.statusCode);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
