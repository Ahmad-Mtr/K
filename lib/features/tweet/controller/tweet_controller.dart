import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/apis/storage_api.dart';
import 'package:x_clone/apis/tweet_api.dart';
import 'package:x_clone/core/enums/tweet_type_enum.dart';
import 'package:x_clone/core/utils.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/models/tweet_model.dart';

final tweetControllerProvider =
    StateNotifierProvider<TweetController, bool>((ref) {
  return TweetController(
    ref: ref,
    tweetAPI: ref.watch(tweetAPIProvider),
    storageAPI: ref.watch(storageAPIProvider),
  );
});

final getTweetsProvider = FutureProvider((ref) {
  final tweetController = ref.watch(tweetControllerProvider.notifier);

  return tweetController.getTweets();
});

class TweetController extends StateNotifier<bool> {
  final StorageAPI _storageAPI;
  final TweetAPI _tweetAPI;
  final Ref _ref;

  TweetController(
      {required StorageAPI storageAPI,
      required Ref ref,
      required TweetAPI tweetAPI})
      : _ref = ref,
        _tweetAPI = tweetAPI,
        _storageAPI = storageAPI,
        super(false);
  Future<List<Tweet>> getTweets() async {
    final tweetList = await _tweetAPI.getTweets();
    return tweetList.map((tweet) => Tweet.fromMap(tweet.data)).toList();
  }

  void shareTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) {
    if (text.isEmpty) {
      showSnackBar(context, 'Please Enter Text');
      return;
    }
    if (images.isNotEmpty) {
      _shareImageTweet(
        images: images,
        text: text,
        context: context,
      );
    } else {
      _shareTextTweet(
        text: text,
        context: context,
      );
    }
  }

  void _shareImageTweet({
    required List<File> images,
    required String text,
    required BuildContext context,
  }) async {
    state = true;
    final hashtags = _getHashtagsFromText(text);
    final link = _getLinkFromText(text);

    final imageLinks = await _storageAPI.uploadImage(images);
    final user = _ref.read(currentUserDetailsProvider).value!;

    Tweet tweet = Tweet(
      text: text,
      link: link,
      hashtags: hashtags,
      imageLinks: imageLinks,
      uid: user.uid,
      tweetType: TweetType.image,
      tweetedAt: DateTime.now(),
      likes: const [],
      commentIds: const [],
      id: '',
      reshareCount: 0,
    );
    final res = await _tweetAPI.shareTweet(tweet);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) => null);
  }

  void _shareTextTweet({
    required String text,
    required BuildContext context,
  }) async {
    state = true;
    final hashtags = _getHashtagsFromText(text);
    final link = _getLinkFromText(text);

    final user = _ref.read(currentUserDetailsProvider).value!;

    Tweet tweet = Tweet(
      text: text,
      link: link,
      hashtags: hashtags,
      imageLinks: const [],
      uid: user.uid,
      tweetType: TweetType.text,
      tweetedAt: DateTime.now(),
      likes: const [],
      commentIds: const [],
      id: '',
      reshareCount: 0,
    );
    final res = await _tweetAPI.shareTweet(tweet);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) => null);
  }

  String _getLinkFromText(String text) {
    String link = '';
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('https://') || word.startsWith('www.')) {
        link = word;
      }
    }
    return link;
  }

  List<String> _getHashtagsFromText(String text) {
    List<String> hashtags = [];
    List<String> wordsInSentence = text.split(' ');
    for (String word in wordsInSentence) {
      if (word.startsWith('#')) hashtags.add(word);
    }
    return hashtags;
  }
}
