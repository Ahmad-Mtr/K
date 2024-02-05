class AppwriteConstants {
  static const String databaseId = '65ba0b435be0fb9e7272';
  static const String projectId = '65ba098d287a4b2cb8bd';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '65ba0bb5a6d6d3ad518e';
  static const String tweetsCollection = '';
  static const String notificationsCollection = '';

  static const String imagesBucket = '6';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
