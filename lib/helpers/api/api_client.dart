import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter_visa_rewards/model/offer.dart';
import 'package:http/io_client.dart';

class ApiClient {
  static String authHeader =
      'Basic ${base64.encode(utf8.encode('BMG2NRF6BCMRQSTCURZI215PztidcKbHJggVBai1PYS9y0hLw:92kvQMvVMs0T74d2K2A668Gvw7'))}';

  ApiClient();

  static Future<IOClient> _getClient() async {
    ByteData certData = await rootBundle.load('assets/certificates/cert.pem');
    ByteData keyData =
        await rootBundle.load('assets/certificates/privateKey.pem');
    final SecurityContext context = SecurityContext.defaultContext;
    context.useCertificateChainBytes(certData.buffer.asUint8List());
    context.usePrivateKeyBytes(keyData.buffer.asUint8List());
    final httpClient = HttpClient(context: context);
    return IOClient(httpClient);
    // final client = IOClient(httpClient);
    // this.client = client;
  }

  static Future<List<Offer>> getOffers() async {
    IOClient client = await _getClient();
    final response = await client.get(
        Uri.parse('https://sandbox.api.visa.com/vmorc/offers/v1/byfilter'),
        headers: {'Authorization': authHeader});
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonList = jsonDecode(response.body);
      List<Offer> offerList = (jsonList["Offers"] as List)
          .where((json) => json['language'] == 'English')
          .map((json) => Offer(
              json["offerShortDescription"]["text"],
              json["merchantList"][0]["merchant"],
              json["merchantTerms"]["text"]))
          .toList();
      client.close();
      return offerList;
    } else {
      throw Exception('Failed to load offers');
    }

    // HttpClientRequest request = await client.getUrl(
    //     Uri.parse('https://sandbox.api.visa.com/vmorc/offers/v1/byfilter'));
    // request.headers.set('authorization', authHeader);
    // final response = await request.close();
    // client.close();
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   Map<String, dynamic> jsonList=jsonDecode(response)
    //   return await response.transform(utf8.decoder).join();
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load offers');
    // }
  }
}
