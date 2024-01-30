class AppwriteConstants {
  static const String databaseId = 'X_clone_db';
  static const String projectId = '65906e300bc24439ea4f';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '65b8c0959ffbc1fa9477';
  static const String tweetsCollection = '';
  static const String notificationsCollection = '';

  static const String imagesBucket = '';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
