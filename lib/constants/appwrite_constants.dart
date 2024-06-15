class AppwriteConstants {
  static const String databaseId = '65ba0b435be0fb9e7272';
  static const String projectId = '65ba098d287a4b2cb8bd';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '65ba0bb5a6d6d3ad518e';
  static const String tweetsCollection = '65c394567c7bc1fe43da';
  static const String notificationsCollection = '65d30c5f6016e91bacbd';

  static const String imagesBucket = '65c399fae6caa3a8ee09';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
