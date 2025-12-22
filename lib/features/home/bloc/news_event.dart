
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  final String category;

  const FetchNewsEvent(this.category);

  @override
  List<Object> get props => [category];
}
