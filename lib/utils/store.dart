import 'package:flutter_dotenv/flutter_dotenv.dart';

const apiURL = 'https://api.spotify.com/v1';
final apiKEY = dotenv.env['SPOTIFY_KEY'];

// Future<dynamic> getAPIData() async {
//   return await 2;
// }
