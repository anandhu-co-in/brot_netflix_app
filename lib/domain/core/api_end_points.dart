import 'package:brot_netflix_app/core/strings.dart';
import 'package:brot_netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseURL/trending/all/day?api_key=$APIKEY";
}
