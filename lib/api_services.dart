import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_api/constants.dart';
import 'package:posts_api/post_model.dart';

class ApiServices {
  static Future<List<PostModel>?> getPosts() async {
    // parse url
    // get data using http.get(url)
    // check 200 ok
    // parse response to model (parse string to json using json.decode)
    // map and convert into model and return list
    try {
      var url = Uri.parse(AppConstants.baseUrl + AppConstants.postsEndPoint);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        List<PostModel> posts = (json.decode(res.body) as List)
            .map((e) => PostModel.fromJson(e))
            .toList();

        return posts;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }
}
