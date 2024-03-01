import 'package:http/http.dart' as http;

class CategoryApi{
  static Future getCategories(){
    var url = Uri.parse('http://10.0.2.2:3000/categories');
    return http.get(url);
  }
}