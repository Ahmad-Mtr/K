class AppwriteConstants {
  static const String databaseId = 'INSERT_YOUR_PROJECTINFO';
  static const String projectId = 'INSERT_YOUR_PROJECTINFO';
  static const String endPoint = 'INSERT_YOUR_PROJECTINFO';

  static const String usersCollection = 'INSERT_YOUR_PROJECTINFO';
  static const String tweetsCollection = 'INSERT_YOUR_PROJECTINFO';
  static const String notificationsCollection = 'INSERT_YOUR_PROJECTINFO';

  static const String imagesBucket = 'INSERT_YOUR_PROJECTINFO';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
