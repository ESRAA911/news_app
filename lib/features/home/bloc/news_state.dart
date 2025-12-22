
import '../data/models/article_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<ArticleModel> articles;

  const NewsSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}

class NewsFailure extends NewsState {
  final String message;

  const NewsFailure(this.message);

  @override
  List<Object> get props => [message];
}
