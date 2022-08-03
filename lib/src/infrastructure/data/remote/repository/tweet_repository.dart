import '../../../models/tweet_model.dart';
import '../firestore_tweet_service.dart';

class TweetsRepository {
  final _firebaseTweet = FirestoreTweetService();

  Future<Stream<List<TweetModel>>> getTweets() async {
    final result = await _firebaseTweet.streamTweet();
    return result;
  }

  Future<bool> addTweets(TweetModel newTweet) async {
    final result = await _firebaseTweet.addTweet(tweet: newTweet);
    return result;
  }

  Future<bool> deleteTweet(TweetModel tweet) async {
    final result = await _firebaseTweet.deleteTweet(tweet);
    return result;
  }

  Future<bool> editTweet({required TweetModel tweet, required newTweet}) async {
    final result =
        await _firebaseTweet.editTweet(tweet: tweet, newTweet: newTweet);
    return result;
  }
}
