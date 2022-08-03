import 'package:cloud_firestore/cloud_firestore.dart';

class TweetModel {
  String? tweetId;
  String? authorId;
  String? authorImage;
  String? authorName;
  Timestamp timestamp;
  String? text;
  int likes;
  int retweets;

  TweetModel(
      {this.tweetId,
      required this.timestamp,
      required this.text,
      required this.authorId,
      required this.authorImage,
      required this.authorName,
      this.likes = 0,
      this.retweets = 0});

  factory TweetModel.fromDocumentSnapshot(
      QueryDocumentSnapshot documentSnapshot) {
    return TweetModel(
        tweetId: documentSnapshot.id,
        authorId: documentSnapshot["authorId"],
        authorImage: documentSnapshot["authordImage"],
        authorName: documentSnapshot["authordName"],
        timestamp: documentSnapshot["dateCreated"],
        text: documentSnapshot["text"],
        likes: documentSnapshot["likes"],
        retweets: documentSnapshot["retweets"]);
  }
}
