import 'package:pocketbase/pocketbase.dart';
import 'package:ubuapp/main.dart';


Future<void> loaddata() async {
  final String apiUrl = 'http://127.0.0.1:8090'; // Replace with your API URL
  final pb = PocketBase(apiUrl);

  final String collectionName = 'ubuapp'; // Replace with your collection name

  for (int i = 0; i < 100; i++) {
    final course = randomCourse();

    final body = {
      "course_id": course[0],
      "title": course[1],
      "lecturer": course[2],
      "background_images": course[3],
    };

    final record = await pb.collection(collectionName).create(body: body);

    if (record != null) {
      print('Row $i Loaded');
    } else {
      print('Failed to load Row $i');
    }
  }

  print('Done loading 100 rows');
}