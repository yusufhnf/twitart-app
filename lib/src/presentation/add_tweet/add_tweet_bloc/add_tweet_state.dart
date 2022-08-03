part of 'add_tweet_cubit.dart';

enum AddTweetType { initial, loading, success, error }

class AddTweetState extends Equatable {
  const AddTweetState(
      {this.addTweetType = AddTweetType.initial,
      this.contentText,
      this.errorHandler});

  final AddTweetType addTweetType;
  final String? contentText;
  final ErrorHandler? errorHandler;

  @override
  List<Object> get props => [
        addTweetType,
        contentText ?? '',
        errorHandler ?? Exception(Strings.somethingWrongLabel)
      ];

  AddTweetState copyWith(
      {AddTweetType? addTweetTypeValue,
      String? contentTextValue,
      ErrorHandler? errorHandlerValue}) {
    return AddTweetState(
        addTweetType: addTweetTypeValue ?? addTweetType,
        contentText: contentTextValue ?? contentText,
        errorHandler: errorHandlerValue ?? errorHandler);
  }
}
