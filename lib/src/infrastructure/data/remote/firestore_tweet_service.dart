import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/tweet_model.dart';
import 'repository/auth_repository.dart';

class FirestoreTweetService {
  final _firestore = FirebaseFirestore.instance;
  final _authRepository = AuthRepository();

  Future<Stream<List<TweetModel>>> streamTweet() async {
    return _firestore
        .collection("tweetFeed")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TweetModel> retVal = [];
      for (var item in query.docs) {
        retVal.add(TweetModel.fromDocumentSnapshot(item));
      }
      return retVal;
    });
  }

  Future<bool> addTweet({required TweetModel tweet}) async {
    try {
      final currentUser = await _authRepository.getUser();
      _firestore.collection('tweetFeed').add({
        "authorId": currentUser?.uid,
        "authordImage": currentUser?.photoURL,
        "authordName": currentUser?.displayName,
        "text": tweet.text,
        "dateCreated": tweet.timestamp,
        "likes": tweet.likes,
        "retweets": tweet.retweets,
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTweet(TweetModel tweet) async {
    try {
      await _firestore.collection("tweetFeed").doc(tweet.tweetId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editTweet(
      {required TweetModel tweet, required String newTweet}) async {
    try {
      await _firestore
          .collection("tweetFeed")
          .doc(tweet.tweetId)
          .update({"text": newTweet});
      return true;
    } catch (e) {
      return false;
    }
  }
}
