import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String body;
  const Post({this.id, this.title, this.body});

  @override
  List<Object> get props => [id, title, body];


  @override
  String toString() => 'Post {id:$id}';
}
